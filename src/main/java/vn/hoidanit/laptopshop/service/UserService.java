package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User handleSaveUser(User user) {
        User eric = userRepository.save(user);
        System.out.println(eric);
        return eric;
    }

        public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }
}
