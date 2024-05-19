package com.example.sweetshop.repositories;

import com.example.sweetshop.entities.Cake;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CakeRepository extends JpaRepository<Cake, Long> {
}
