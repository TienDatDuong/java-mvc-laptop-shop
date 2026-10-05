package laptopshop.controller.client;

import laptopshop.domain.Products;
import laptopshop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ItemController {

    private ProductService productService;

    public ItemController( ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        return "client/product/detail";
    };

    @GetMapping(value = "/admin/product/create")
    public String createProductPage(Model model) {
        model.addAttribute("product", new Products());

        return "admin/product/create";
    }

    @GetMapping(value = "/cline/product/detail/{id}")
    public String getClineDetailPage(Model model, @PathVariable long id) {
        Products product = this.productService.getProductById(id);
        model.addAttribute("product", product);
      return   "client/product/detail";
    };
}
