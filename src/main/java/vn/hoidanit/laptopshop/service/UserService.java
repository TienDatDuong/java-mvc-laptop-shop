package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User GetUser(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public User Update(User user) {
        User existingUser = this.userRepository.findById(user.getId());
        if (existingUser != null) {
            existingUser.setFullName(user.getFullName());
            existingUser.setEmail(user.getEmail());
            existingUser.setAddress(user.getAddress());
            existingUser.setPhone(user.getPhone());
            return this.userRepository.save(existingUser);
        }   else {
            return null; // Hoặc bạn có thể ném ra một ngoại lệ tùy thuộc vào cách bạn muốn xử lý trường hợp này
        }
    }
}