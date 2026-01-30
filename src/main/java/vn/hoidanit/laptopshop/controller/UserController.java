package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
    this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String message = this.userService.handleHello();
        model.addAttribute("keyMessage", message);
        return "hello"; //trả về tên view
    }
}

// @RestController
// public class UserController {

//     private UserService userService;

//     public UserController(UserService userService) {
//         this.userService = userService;
//     }

//     @GetMapping("")
//     public String getHomePage() {
//         return this.userService.handleHello();
//     }
// }