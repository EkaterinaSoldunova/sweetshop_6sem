package com.example.sweetshop.services;

import com.example.sweetshop.entities.Cake;
import com.example.sweetshop.entities.User;
import com.example.sweetshop.entities.enums.Role;
import com.example.sweetshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    //шифрование паролей
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        if (userRepository.findAll().size()==0){
            User admin = new User();
            admin.setPassword(passwordEncoder.encode("1"));
            admin.setName("Администратор");
            admin.getRoles().add(Role.ROLE_ADMIN);
            admin.setActive(true);
            admin.setPhoneNumber("89503864962");
            admin.setEmail("admin@mail.ru");
            userRepository.save(admin);
        }
        if (userRepository.findByEmail(user.getEmail()) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        userRepository.save(user);
        return true;
    }

    public List<User> list(){
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null){
            if (user.isActive()){
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else{
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public User getUserById(Long id){
        return userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
    }
}
