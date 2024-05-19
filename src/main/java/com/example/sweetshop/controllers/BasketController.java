package com.example.sweetshop.controllers;

import com.example.sweetshop.entities.Basket;
import com.example.sweetshop.entities.Cake;
import com.example.sweetshop.entities.User;
import com.example.sweetshop.services.BasketService;
import com.example.sweetshop.services.CakeService;
import com.example.sweetshop.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class BasketController {
    private final BasketService basketService;
    private final CakeService cakeService;
    private final UserService userService;

    @GetMapping("/basket/{userId}")
    public String basket(Model model, @PathVariable Long userId, Principal principal){
        User user = userService.getUserById(userId);
        model.addAttribute("basket", basketService.listBasketByUser(user));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "basket";
    }

    @PostMapping("/basket/{userId}/add/{cakeId}")
    public String addToBasket(@PathVariable Long cakeId, @PathVariable Long userId) {
        Cake cake = cakeService.getCakeById(cakeId);
        User user = userService.getUserById(userId);
        if (cake.getBeing() == 0) {
            return "redirect:/";
        }
        else {
            Basket basket = new Basket();
            basket.setCake(cake);
            basket.setUser(user);
            basketService.addCakeToBasket(basket);
            return "redirect:/";
        }
    }

    @PostMapping("/basket/{userId}/delete/{id}")
    public String deleteFromBasket(@PathVariable Long id) {
        basketService.deleteCakeFromBasket(id);
        return "redirect:/basket/{userId}";
    }

    @PostMapping("/basket/{userId}/deleteAll")
    public String deleteAllFromBasketByUser(@PathVariable Long userId) {
        User user = userService.getUserById(userId);
        basketService.deleteAllFromBasketByUser(user);
        return "redirect:/basket/{userId}";
    }
}
