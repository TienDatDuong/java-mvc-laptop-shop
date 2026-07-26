package laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return false;
        }
        // Đoạn này chứa logic kiểm tra mật khẩu mạnh (bạn có thể thay đổi tùy ý)
        return value.matches("^(?=.*[a-z])(?=.*[A-Z]).{8,}$");
    }
}
