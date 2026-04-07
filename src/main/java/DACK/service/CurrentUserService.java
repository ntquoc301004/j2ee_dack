package DACK.service;

import DACK.model.User;
import DACK.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

/**
 * Lấy {@link User} đang đăng nhập từ {@link SecurityContextHolder}.
 * <p>
 * Lưu ý: Đăng nhập Google (scope {@code openid}) dùng OIDC — principal là {@link OidcUser},
 * {@link Authentication#getName()} thường là mã {@code sub} của Google, <b>không</b> phải username trong bảng users.
 * Vì vậy phải tra cứu theo {@link User#getGoogleSub()} khi có.
 */
@Service
@RequiredArgsConstructor
public class CurrentUserService {
    private final UserRepository userRepository;

    /**
     * Bắt buộc có user trong DB; nếu không (chưa đăng nhập hoặc dữ liệu không khớp) ném lỗi.
     * Ưu tiên dùng {@link #currentUserOrNull()} + redirect trong controller để tránh Whitelabel 500.
     */
    public User requireUser() {
        User user = currentUserOrNull();
        if (user == null) {
            throw new IllegalStateException("No authenticated user");
        }
        return user;
    }

    /**
     * Trả về entity User tương ứng phiên đăng nhập hiện tại, hoặc null nếu chưa đăng nhập / không tìm thấy trong DB.
     */
    public User currentUserOrNull() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated()) {
            return null;
        }

        String name = auth.getName();
        if (name == null || "anonymousUser".equals(name)) {
            return null;
        }

        Object principal = auth.getPrincipal();

        // --- Google OIDC: tên đăng nhập trong Security là "sub", tra theo cột google_sub ---
        if (principal instanceof OidcUser oidcUser) {
            String sub = oidcUser.getSubject();
            if (sub != null && !sub.isBlank()) {
                var bySub = userRepository.findByGoogleSub(sub.trim());
                if (bySub.isPresent()) {
                    return bySub.get();
                }
            }
        }

        // --- OAuth2 (userinfo): thử sub rồi tới thuộc tính nội bộ shop ---
        if (principal instanceof OAuth2User oauth2User) {
            Object subAttr = oauth2User.getAttribute("sub");
            if (subAttr instanceof String s && !s.isBlank()) {
                var bySub = userRepository.findByGoogleSub(s.trim());
                if (bySub.isPresent()) {
                    return bySub.get();
                }
            }
            Object internal = oauth2User.getAttribute("internalUsername");
            if (internal instanceof String in && !in.isBlank()) {
                var byInternal = userRepository.findByUsername(in.trim())
                        .or(() -> userRepository.findByUsernameIgnoreCase(in.trim()));
                if (byInternal.isPresent()) {
                    return byInternal.get();
                }
            }
        }

        // --- Form login / UserDetails: khớp username ---
        final String loginKey = principal instanceof UserDetails ud ? ud.getUsername() : name;

        return userRepository.findByUsername(loginKey)
                .or(() -> userRepository.findByUsernameIgnoreCase(loginKey))
                .orElse(null);
    }
}
