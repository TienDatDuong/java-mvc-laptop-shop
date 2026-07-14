package laptopshop.controller.admin;

import java.io.IOException;
import java.util.List;


import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import laptopshop.domain.User;
import laptopshop.service.UploadService;
import laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private  final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;


    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

//    @RequestMapping("/")
//    public String getHomePage(Model model) {
//        // String message = this.userService.handleHello();
//        model.addAttribute("keyMessage", "message");
//        return "hello";
//    }


    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> arrListUser = this.userService.getAllUser();
        model.addAttribute("listUsers", arrListUser);
        return "admin/user/table-user";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(
            Model model,
            @Valid @ModelAttribute("newUser") User dtdat ,
            BindingResult newBindingResult,
            @RequestParam("avatar") MultipartFile file) throws IOException {

//            List<FieldError> errors = (List<FieldError>) newBindingResult.getFieldError();
        // RIGHT: This returns a List natively
        List<FieldError> errors = newBindingResult.getFieldErrors();


            for (FieldError error : errors) {
                System.out.println(">>>>" + error.getField() + ">>>>" + error.getDefaultMessage());
            }
            if (newBindingResult.hasErrors()) {
                return "admin/user/create";
            }
             String fileImg = uploadService.handlerSaveUploadFile(file, "avatar");

             dtdat.setPassword(passwordEncoder.encode(dtdat.getPassword()));
            dtdat.setAvartar(fileImg);

            dtdat.setRole( userService.getRoleByName(dtdat.getRole().getName()));
           this.userService.handleSaveUser(dtdat);
            return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/create")
    public String createUserPage(Model model) {
        model.addAttribute("newUser", new User());

        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/view/{id}")
    public String viewUserPage(Model model, @PathVariable long id) {
        User user = this.userService.GetUserById(id);
        model.addAttribute("user", user);
        return "admin/user/view";
    }

    @RequestMapping(value = "/admin/user/edit/{id}")
    public String editUserPage(Model model, @PathVariable long id) {
        User user = this.userService.GetUserById(id);
        model.addAttribute("users", user);
        System.out.println("user ===>" + user);
        return "admin/user/edit";
    }

    @PostMapping("/admin/user/edit")
    public String updateUserPage(
            Model model,
            @ModelAttribute("users") User dtdat,
            @RequestParam(value = "avatar", required = false) MultipartFile file) throws IOException {
        User currentUser = this.userService.GetUserById(dtdat.getId());
        if (currentUser != null) {
            currentUser.setAddress(dtdat.getAddress());
            currentUser.setFullName(dtdat.getFullName());
            currentUser.setPhone(dtdat.getPhone());

            if (file != null && !file.isEmpty()) {
                String fileImg = uploadService.handlerSaveUploadFile(file, "avatar");
                currentUser.setAvartar(fileImg);
            }

            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

     @RequestMapping(value = "/admin/user/delete/{id}")
     public String deleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("users", new User());
     return "/admin/user/delete";
     }

    @PostMapping("/admin/user/delete")
    public String deleteUser(Model model, @ModelAttribute("users") User dtdat) {
        this.userService.deleteUserById(dtdat.getId());
        return "redirect:/admin/user";
    }

}

// @RestController
// public class UserController {

// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("")
// public String getHomePage() {
// return this.userService.handleHello();
// }
// }