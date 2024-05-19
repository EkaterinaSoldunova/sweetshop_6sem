package com.example.sweetshop.services;

import com.example.sweetshop.entities.Cake;
import com.example.sweetshop.entities.User;
import com.example.sweetshop.repositories.CakeRepository;
import com.example.sweetshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CakeService {
    private final CakeRepository cakeRepository;
    private final UserRepository userRepository;
    public List<Cake> listCakes() {
        return cakeRepository.findAll();
    }
    public void saveCake(Cake cake) {
        log.info("Saving new {}", cake);
        cakeRepository.save(cake);
    }
    public void deleteCake(Long id){
        cakeRepository.deleteById(id);
    }
    public void updateCake(Cake cake){
        Cake updateCake = cakeRepository.findById(cake.getId()).orElseThrow();

        updateCake.setName(cake.getName());
        updateCake.setPrice(cake.getPrice());
        updateCake.setBeing(cake.getBeing());

        cakeRepository.save(updateCake);
    }
    public Cake getCakeById(Long id){
        return cakeRepository.findById(id).orElseThrow(() -> new RuntimeException("Cake not found"));
    }
}
