package DACK.web;

import DACK.cart.CartService;
import DACK.repo.CategoryRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Sort;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
@RequiredArgsConstructor
public class StoreNavModelAdvice {

    private final CategoryRepository categoryRepository;
    private final CartService cartService;
    private final Environment environment;

    @ModelAttribute("storeNavCategories")
    public Object storeNavCategories() {
        return categoryRepository.findAll(Sort.by(Sort.Direction.ASC, "name"));
    }

    @ModelAttribute("cartItemCount")
    public int cartItemCount(HttpSession session) {
        return cartService.countItems(session);
    }

    /** Hiển thị nút "Đăng nhập Google" khi đã cấu hình Client ID trong properties / biến môi trường. */
    @ModelAttribute("googleOAuthLoginEnabled")
    public boolean googleOAuthLoginEnabled() {
        return StringUtils.hasText(
                environment.getProperty("spring.security.oauth2.client.registration.google.client-id"));
    }
}
