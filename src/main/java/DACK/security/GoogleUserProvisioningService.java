package DACK.security;

import DACK.model.RoleName;
import DACK.model.User;
import DACK.repo.RoleRepository;
import DACK.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.Optional;
import java.util.UUID;

/**
 * Tìm hoặc tạo {@link User} trong DB từ claims Google (OIDC / userinfo).
 * Dùng chung cho {@link GoogleOAuth2UserService} và {@link GoogleOidcUserService}.
 */
@Service
@RequiredArgsConstructor
public class GoogleUserProvisioningService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    /**
     * Đồng bộ bản ghi người dùng cửa hàng với thông tin Google (sub, email, tên hiển thị…).
     *
     * @param attrs map thuộc tính từ Google (userinfo / id token claims)
     * @return user đã tồn tại hoặc mới tạo
     */
    @Transactional
    public User provisionFromGoogleAttributes(Map<String, Object> attrs) {
        String subRaw = asString(attrs.get("sub"));
        if (subRaw == null || subRaw.isBlank()) {
            throw new OAuth2AuthenticationException(new OAuth2Error("invalid_user"), "Thiếu mã định danh Google (sub)");
        }
        final String sub = subRaw.trim();

        String emailRaw = asString(attrs.get("email"));
        if (emailRaw == null || emailRaw.isBlank()) {
            throw new OAuth2AuthenticationException(
                    new OAuth2Error("email_required"),
                    "Tài khoản Google không cung cấp email. Hãy cấp quyền email hoặc dùng tài khoản khác."
            );
        }
        final String email = emailRaw.trim();

        if (!isEmailVerified(attrs.get("email_verified"))) {
            throw new OAuth2AuthenticationException(
                    new OAuth2Error("email_not_verified"),
                    "Email Google chưa được xác minh. Vui lòng xác minh email trên Google rồi thử lại."
            );
        }

        return userRepository.findByGoogleSub(sub)
                .or(() -> linkOrFindByEmail(sub, email))
                .orElseGet(() -> registerNewGoogleUser(sub, email, attrs));
    }

    /**
     * Tài khoản đã có (đăng ký form) cùng email → gắn {@code googleSub} để lần sau đăng nhập Google nhận ra.
     */
    private Optional<User> linkOrFindByEmail(String sub, String email) {
        Optional<User> byEmail = userRepository.findByEmailIgnoreCase(email);
        if (byEmail.isEmpty()) {
            return Optional.empty();
        }
        User u = byEmail.get();
        if (u.getGoogleSub() == null || u.getGoogleSub().isBlank()) {
            u.setGoogleSub(sub);
            userRepository.save(u);
            return Optional.of(u);
        }
        if (sub.equals(u.getGoogleSub())) {
            return Optional.of(u);
        }
        throw new OAuth2AuthenticationException(
                new OAuth2Error("account_conflict"),
                "Email này đã liên kết với tài khoản Google khác."
        );
    }

    private User registerNewGoogleUser(String sub, String email, Map<String, Object> googleAttrs) {
        var customerRole = roleRepository.findByName(RoleName.CUSTOMER)
                .orElseThrow(() -> new IllegalStateException("Thiếu role CUSTOMER trong database"));

        User u = new User();
        u.setUsername(generateUniqueUsername(email, sub));
        u.setEmail(email);
        u.setFullName(resolveFullName(googleAttrs));
        u.setGoogleSub(sub);
        // Mật khẩu ngẫu nhiên (BCrypt): user chỉ đăng nhập qua Google, không dùng form với mật khẩu này
        u.setPassword(passwordEncoder.encode(UUID.randomUUID() + UUID.randomUUID().toString()));
        u.getRoles().add(customerRole);
        return userRepository.save(u);
    }

    private String resolveFullName(Map<String, Object> attrs) {
        String name = asString(attrs.get("name"));
        if (name != null && !name.isBlank()) {
            return name.trim();
        }
        String given = asString(attrs.get("given_name"));
        String family = asString(attrs.get("family_name"));
        if (given != null && family != null && !given.isBlank() && !family.isBlank()) {
            return (given + " " + family).trim();
        }
        if (given != null && !given.isBlank()) {
            return given.trim();
        }
        if (family != null && !family.isBlank()) {
            return family.trim();
        }
        return "Thành viên";
    }

    /**
     * Tạo username hợp lệ (chữ, số, . _ -), tránh trùng không phân biệt hoa thường.
     */
    private String generateUniqueUsername(String email, String googleSub) {
        int at = email.indexOf('@');
        String local = at > 0 ? email.substring(0, at) : email;
        String base = local.replaceAll("[^a-zA-Z0-9._-]", "_");
        if (base.length() < 3) {
            base = "user_" + googleSub.substring(0, Math.min(12, googleSub.length())).replaceAll("[^a-zA-Z0-9._-]", "_");
        }
        if (base.length() > 45) {
            base = base.substring(0, 45);
        }
        String candidate = base;
        for (int i = 0; i < 30 && userRepository.existsByUsernameIgnoreCase(candidate); i++) {
            String suffix = "_" + (i + 1);
            candidate = base.substring(0, Math.min(base.length(), 50 - suffix.length())) + suffix;
        }
        if (userRepository.existsByUsernameIgnoreCase(candidate)) {
            candidate = "g_" + UUID.randomUUID().toString().replace("-", "").substring(0, 12);
        }
        return candidate;
    }

    private static String asString(Object o) {
        return o == null ? null : String.valueOf(o);
    }

    /** Google có thể trả boolean hoặc chuỗi "true"/"false". */
    private static boolean isEmailVerified(Object verified) {
        if (verified == null) {
            return true;
        }
        if (verified instanceof Boolean b) {
            return b;
        }
        if (verified instanceof String s) {
            return "true".equalsIgnoreCase(s) || "1".equals(s);
        }
        return true;
    }
}
