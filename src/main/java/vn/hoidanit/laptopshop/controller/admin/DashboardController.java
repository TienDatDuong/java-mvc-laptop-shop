package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {

    @RequestMapping("/admin")
    public String getDashboard(Model model) {
        // String message = this.userService.handleHello();
        model.addAttribute("keyMessage", "message");
        return "admin/dashboard/show";
    }
}
