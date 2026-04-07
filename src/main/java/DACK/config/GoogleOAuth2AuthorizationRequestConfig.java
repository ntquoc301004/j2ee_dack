package DACK.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.DefaultOAuth2AuthorizationRequestResolver;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestResolver;

/**
 * Bổ sung tham số {@code prompt} khi redirect sang Google OAuth.
 * <ul>
 *     <li>{@code select_account} — luôn hiện bước chọn tài khoản Google (không đăng nhập thẳng bằng session có sẵn).</li>
 *     <li>{@code consent} — hiện lại màn hình đồng ý quyền truy cập (email, profile…).</li>
 * </ul>
 */
@Configuration
@ConditionalOnBean(ClientRegistrationRepository.class)
public class GoogleOAuth2AuthorizationRequestConfig {

    private static final String OAUTH2_AUTHORIZATION_BASE_URI = "/oauth2/authorization";

    @Bean
    OAuth2AuthorizationRequestResolver oauth2AuthorizationRequestResolver(
            ClientRegistrationRepository clientRegistrationRepository
    ) {
        DefaultOAuth2AuthorizationRequestResolver resolver =
                new DefaultOAuth2AuthorizationRequestResolver(
                        clientRegistrationRepository,
                        OAUTH2_AUTHORIZATION_BASE_URI);
        resolver.setAuthorizationRequestCustomizer(customizer ->
                customizer.additionalParameters(params ->
                        params.put("prompt", "select_account consent")));
        return resolver;
    }
}
