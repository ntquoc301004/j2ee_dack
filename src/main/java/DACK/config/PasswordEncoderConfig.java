package DACK.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Tách bean mã hóa mật khẩu ra khỏi {@link SecurityConfig} để tránh vòng phụ thuộc
 * với {@link DACK.security.GoogleOAuth2UserService} (service đó cũng cần {@link PasswordEncoder}).
 */
@Configuration
public class PasswordEncoderConfig {

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
