package com.example.sweetshop.controllers;

import com.example.sweetshop.services.OrderService;
import com.example.sweetshop.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final OrderService orderService;
    @GetMapping("/admin")
    public String admin(Model model, Principal principal){
        model.addAttribute("users", userService.list());
        model.addAttribute("orders", orderService.listOrders());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin";
    }
    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id){
        userService.banUser(id);
        return "redirect:/admin";
    }
    @PostMapping("/admin/order/active/{orderId}")
    public String updateOrderActive(@PathVariable("orderId") Long orderId){
        orderService.updateOrderActive(orderId);
        return "redirect:/admin";
    }
}
