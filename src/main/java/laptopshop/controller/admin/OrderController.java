package laptopshop.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
    @RequestMapping("/admin/order")
    public String getUserPage(Model model) {
        return "admin/order/show";
    }
}
