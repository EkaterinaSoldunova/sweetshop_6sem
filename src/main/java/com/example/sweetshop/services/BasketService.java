package com.example.sweetshop.services;

import com.example.sweetshop.entities.Basket;
import com.example.sweetshop.entities.Cake;
import com.example.sweetshop.entities.Order;
import com.example.sweetshop.entities.User;
import com.example.sweetshop.repositories.BasketRepository;
import com.example.sweetshop.repositories.CakeRepository;
import com.example.sweetshop.repositories.OrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
@Slf4j
@RequiredArgsConstructor
public class BasketService {
    private final BasketRepository basketRepository;
    private final OrderRepository orderRepository;

    public List<Basket> listBasket() {
        return basketRepository.findAll();
    }

    public List<Basket> listBasketByUser(User user) {
        return basketRepository.findAllByUser(user);
    }

    public void addCakeToBasket(Basket basket) {

        basketRepository.save(basket);
    }

    public void deleteCakeFromBasket(Long id) {
        basketRepository.deleteById(id);
    }
    public void deleteAllFromBasketByUser(User user) {
        List<Basket> basketCakes = basketRepository.findAllByUser(user);
        for (Basket b : basketCakes){
            Cake cake = b.getCake();
            cake.setBeing(cake.getBeing()-1);
            Order order = new Order();
            order.setCake(b.getCake());
            order.setUser(b.getUser());
            order.setActive(true);
            orderRepository.save(order);
            basketRepository.deleteById(b.getId());
        }
    }
}


