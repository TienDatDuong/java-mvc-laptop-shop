package laptopshop.controller.admin;

import jakarta.validation.Valid;
import laptopshop.domain.Product;
import laptopshop.domain.User;
import laptopshop.repository.ProductRepository;
import laptopshop.service.ProductService;
import laptopshop.service.UploadService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @RequestMapping("/admin/product")
    public String getUserPage(Model model) {
        List<Product> arrListProduct = this.productService.getAllProducts();
        model.addAttribute("products", arrListProduct);
        return "admin/product/show";
    }

    @RequestMapping("/admin/product/view/{id}")
    public String viewProduct(
            Model model,
            @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/view";
    }

    @RequestMapping(value = "/admin/product/delete/{id}")
    public String deleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("products", new User());
        return "/admin/product/delete";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(Model model, @ModelAttribute("users") User dtdat) {
        this.productService.deleteProductById(dtdat.getId());
        return "redirect:/admin/product";
    }

    @RequestMapping(value = "/admin/product/create", method = RequestMethod.POST)
    public String createUserPage(
            Model model,
            @Valid @ModelAttribute("product") Product productItem,
            BindingResult bindingResult,
            @RequestParam("imageProduct") MultipartFile file) throws IOException {

            List<FieldError> errors = bindingResult.getFieldErrors();

            for (FieldError error : errors) {
                System.out.println(">>>>>" + error.getField() + ">>>>" + error.getDefaultMessage());
            }

            if(bindingResult.hasErrors()){
                return "admin/product/create";
            }

            String fileImg = uploadService.handlerSaveUploadFile(file, "image");

            productItem.setImage(fileImg);
           this.productService.handSaveUser(productItem);
        return "redirect:/admin/product";
    }
}
