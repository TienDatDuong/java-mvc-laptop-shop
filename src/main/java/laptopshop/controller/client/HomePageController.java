package laptopshop.controller.client;

import org.springframework.ui.Model;
import laptopshop.domain.Products;
import laptopshop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomePageController {
    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {
        List<Products> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }
}
