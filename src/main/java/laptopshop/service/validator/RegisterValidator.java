package laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext; 
import laptopshop.domain.DTO.RegisterDTO;
import laptopshop.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        if (user.getPassword() == null || user.getPassword().trim().isEmpty()
                || user.getConfirmPassword() == null || user.getConfirmPassword().trim().isEmpty()) {
            return true;
        }

        boolean valid = true;

        // Kiểm tra xem hai trường mật khẩu có khớp nhau không
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            // CHÚ Ý: Đưa disableDefaultConstraintViolation() lên đầu tiên
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Passwords không chính xác")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();

            valid = false;
        }

        if (this.userService.checkEmail(user.getEmail())) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation();

            valid = false;
        }

        return valid;
    }
}
