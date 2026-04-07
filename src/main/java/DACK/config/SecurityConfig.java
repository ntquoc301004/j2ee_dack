package DACK.config;

import DACK.model.RoleName;
import DACK.repo.UserRepository;
import DACK.security.GoogleOAuth2UserService;
import DACK.security.GoogleOidcUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestResolver;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.util.StringUtils;

/**
 * Cấu hình bảo mật: form login, (tùy chọn) OAuth2 Google, phân quyền theo vai trò ADMIN / CUSTOMER.
 */
@Configuration
@RequiredArgsConstructor
public class SecurityConfig {

    private static final String ROLE_ADMIN_AUTHORITY = "ROLE_" + RoleName.ADMIN.name();

    /** Đọc biến môi trường / properties để biết có bật đăng nhập Google hay không. */
    private final Environment environment;
    /** Ghép tài khoản Google (OAuth2 userinfo) với bản ghi {@link DACK.model.User}. */
    private final GoogleOAuth2UserService googleOAuth2UserService;
    /** Ghép tài khoản Google (OIDC — luồng chính khi có scope openid). */
    private final GoogleOidcUserService googleOidcUserService;
    /** Tùy chọn: thêm {@code prompt} (chọn tài khoản + consent) khi redirect Google. */
    private final ObjectProvider<OAuth2AuthorizationRequestResolver> oauth2AuthorizationRequestResolver;

    /**
     * Sau đăng nhập thành công (form hoặc Google): ADMIN → /admin/dashboard; khách → /home.
     */
    @Bean
    AuthenticationSuccessHandler loginSuccessHandler() {
        SavedRequestAwareAuthenticationSuccessHandler customerHandler = new SavedRequestAwareAuthenticationSuccessHandler();
        customerHandler.setDefaultTargetUrl("/home");
        customerHandler.setAlwaysUseDefaultTargetUrl(true);
        return (request, response, authentication) -> {
            if (isAdmin(authentication)) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                return;
            }
            customerHandler.onAuthenticationSuccess(request, response, authentication);
        };
    }

    private static boolean isAdmin(Authentication authentication) {
        return authentication.getAuthorities().stream()
                .anyMatch(a -> ROLE_ADMIN_AUTHORITY.equals(a.getAuthority()));
    }

    @Bean
    UserDetailsService userDetailsService(UserRepository userRepository) {
        return username -> userRepository.findByUsername(username)
                .map(u -> {
                    var authorities = u.getRoles().stream()
                            .map(r -> new SimpleGrantedAuthority("ROLE_" + r.getName().name()))
                            .toList();
                    UserDetails ud = org.springframework.security.core.userdetails.User
                            .withUsername(u.getUsername())
                            .password(u.getPassword())
                            .authorities(authorities)
                            .build();
                    return ud;
                })
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
    }

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http, AuthenticationSuccessHandler loginSuccessHandler) throws Exception {
        // Có Client ID Google → bật đăng nhập OAuth2; không có → chỉ form login như cũ
        boolean googleOAuthEnabled = StringUtils.hasText(
                environment.getProperty("spring.security.oauth2.client.registration.google.client-id"));

        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/home", "/about", "/news", "/books/**", "/contact", "/register", "/login",
                                "/forgot-password", "/reset-password",
                                "/oauth2/**", "/login/oauth2/**",
                                "/css/**", "/images/**", "/h2-console/**").permitAll()
                        .requestMatchers("/admin/**").hasRole(RoleName.ADMIN.name())
                        .requestMatchers("/cart/**", "/checkout/**", "/orders/**").hasRole(RoleName.CUSTOMER.name())
                        .anyRequest().authenticated()
                );

        if (googleOAuthEnabled) {
            http.oauth2Login(oauth2 -> {
                oauth2.authorizationEndpoint(auth ->
                        oauth2AuthorizationRequestResolver.ifAvailable(auth::authorizationRequestResolver));
                oauth2.loginPage("/login");
                // Google + scope openid → OIDC (OidcUserService). Chỉ OAuth2 userinfo → OAuth2UserService.
                oauth2.userInfoEndpoint(userInfo -> userInfo
                        .userService(googleOAuth2UserService)
                        .oidcUserService(googleOidcUserService));
                oauth2.successHandler(loginSuccessHandler);
            });
        }

        http
                .formLogin(form -> form
                        .loginPage("/login")
                        .successHandler(loginSuccessHandler)
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutSuccessUrl("/home")
                        .permitAll()
                )
                .httpBasic(Customizer.withDefaults());

        // H2 console support (dev only)
        http.csrf(csrf -> csrf.ignoringRequestMatchers("/h2-console/**"));
        http.headers(headers -> headers.frameOptions(frame -> frame.sameOrigin()));

        return http.build();
    }
}

