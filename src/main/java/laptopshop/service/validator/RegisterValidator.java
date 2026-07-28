package laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext; 
import laptopshop.domain.DTO.RegisterDTO;


public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

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

        return valid;
    }
}
