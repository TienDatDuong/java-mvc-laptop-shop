package laptopshop.controller.client;

import laptopshop.domain.DTO.RegisterDTO;
import laptopshop.domain.User;
import laptopshop.service.UserService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import laptopshop.domain.Products;
import laptopshop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {
        List<Products> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "admin/auth/register";
    }

    @PostMapping("/register")
    public String getRegisterPage(Model model, @ModelAttribute("registerUser") RegisterDTO register) {
       User user = this.userService.registerDTOtoUser(register);
        String hashPassword = passwordEncoder.encode(register.getPassword());

        user.setPassword(passwordEncoder.encode(hashPassword));
        user.setRole( userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String getLoginPage(Model model) {

        return "client/auth/login";
    }
}
