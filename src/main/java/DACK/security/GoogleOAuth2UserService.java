package DACK.security;

import DACK.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Luồng OAuth2 “thuần” (ít gặp với Google khi đã bật {@code openid}).
 * Vẫn giữ để đồng bộ DB giống {@link GoogleOidcUserService}.
 */
@Service
@RequiredArgsConstructor
public class GoogleOAuth2UserService extends DefaultOAuth2UserService {

    private final GoogleUserProvisioningService provisioning;

    @Override
    @Transactional
    public OAuth2User loadUser(OAuth2UserRequest userRequest) {
        OAuth2User googleUser = super.loadUser(userRequest);

        User user = provisioning.provisionFromGoogleAttributes(googleUser.getAttributes());

        var authorities = user.getRoles().stream()
                .map(r -> new SimpleGrantedAuthority("ROLE_" + r.getName().name()))
                .collect(Collectors.toList());

        Map<String, Object> attrs = new HashMap<>(googleUser.getAttributes());
        attrs.put("internalUsername", user.getUsername());

        return new ShopOAuth2User(user.getUsername(), authorities, attrs);
    }
}
