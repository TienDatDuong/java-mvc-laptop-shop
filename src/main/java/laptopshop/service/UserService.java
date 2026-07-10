package laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import laptopshop.domain.Role;
import laptopshop.domain.User;
import laptopshop.repository.RoleRepository;
import laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository,
                       RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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

    public User GetUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

     public void deleteUserById(long id) {
         this.userRepository.deleteById(id);
     };

    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    };
}