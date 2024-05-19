package com.example.sweetshop.services;

import com.example.sweetshop.entities.Basket;
import com.example.sweetshop.entities.Order;
import com.example.sweetshop.entities.User;
import com.example.sweetshop.repositories.OrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    public List<Order> listOrders() {
        return orderRepository.findAll();
    }
    public void updateOrderActive(Long orderId){
        Order order = orderRepository.findById(orderId).orElse(null);
        if (order != null){
            if (order.isActive()){
                order.setActive(false);
            } else{
                order.setActive(true);
            }
        }
        orderRepository.save(order);
    }
}
