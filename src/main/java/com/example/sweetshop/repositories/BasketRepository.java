package com.example.sweetshop.repositories;

import com.example.sweetshop.entities.Basket;
import com.example.sweetshop.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BasketRepository extends JpaRepository<Basket, Long> {
    List<Basket> findAllByUser(User user);
}
