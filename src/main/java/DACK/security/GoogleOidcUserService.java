package DACK.security;

import DACK.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.core.oidc.OidcUserInfo;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Luồng đăng nhập Google với scope {@code openid} dùng OIDC — Spring gọi {@link OidcUserService}, không phải {@link org.springframework.security.oauth2.client.userinfo.OAuth2UserService}.
 * Sau khi lấy {@link OidcUser} mặc định, đồng bộ DB rồi trả về {@link DefaultOidcUser} có claim {@code preferred_username} = username trong shop
 * để {@link Authentication#getName()} khớp bảng {@code users}.
 */
@Service
@RequiredArgsConstructor
public class GoogleOidcUserService extends OidcUserService {

    private final GoogleUserProvisioningService provisioning;

    @Override
    @Transactional
    public OidcUser loadUser(OidcUserRequest userRequest) {
        OidcUser oidc = super.loadUser(userRequest);

        Map<String, Object> attrs = new LinkedHashMap<>(oidc.getAttributes());
        User user = provisioning.provisionFromGoogleAttributes(attrs);

        // Ghi đè / bổ sung claim để DefaultOidcUser.getName() trả về username DB (không phải sub Google)
        attrs.put("preferred_username", user.getUsername());

        OidcUserInfo extendedInfo = new OidcUserInfo(attrs);
        var authorities = user.getRoles().stream()
                .map(r -> new SimpleGrantedAuthority("ROLE_" + r.getName().name()))
                .collect(Collectors.toList());

        return new DefaultOidcUser(authorities, oidc.getIdToken(), extendedInfo, "preferred_username");
    }
}
