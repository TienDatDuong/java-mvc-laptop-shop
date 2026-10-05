package laptopshop.service.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.*;

@Constraint(validatedBy = StrongPasswordValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface StrongPassword { // Thay 'class' bằng 'public @interface'

    String message() default "Must be 8 characters long and combination of uppercase letter, lowercase letter";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
