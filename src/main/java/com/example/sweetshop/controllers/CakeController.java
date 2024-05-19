package com.example.sweetshop.controllers;

import com.example.sweetshop.entities.Cake;
import com.example.sweetshop.services.CakeService;
import com.example.sweetshop.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class CakeController {
    private final CakeService cakeService;
    private final UserService userService;

    @GetMapping("/")
    public String cakes(Model model, Principal principal){
        model.addAttribute("cakes", cakeService.listCakes());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "index";
    }
    @PostMapping("/cake/create")
    public String createCake(Cake cake){
        cakeService.saveCake(cake);
        return "redirect:/";
    }
    @PostMapping("/cake/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        cakeService.deleteCake(id);
        return  "redirect:/";
    }
    @PostMapping("/cake/update")
    public String editCake(Cake cake) {
        cakeService.updateCake(cake);
        return "redirect:/";
    }
}
