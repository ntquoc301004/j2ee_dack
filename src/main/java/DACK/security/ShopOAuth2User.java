package DACK.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

/**
 * Người dùng OAuth2 dùng trong cửa hàng: {@link #getName()} trả về <b>tên đăng nhập trong DB</b>
 * (không phải mã Google "sub") để {@code SecurityContext} và {@code CurrentUserService} hoạt động thống nhất với form login.
 */
public class ShopOAuth2User implements OAuth2User {

    private final String username;
    private final Collection<? extends GrantedAuthority> authorities;
    private final Map<String, Object> attributes;

    public ShopOAuth2User(
            String username,
            Collection<? extends GrantedAuthority> authorities,
            Map<String, Object> attributes
    ) {
        this.username = username;
        this.authorities = authorities == null ? Collections.emptyList() : authorities;
        this.attributes = attributes == null ? Map.of() : Map.copyOf(attributes);
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getName() {
        return username;
    }
}
