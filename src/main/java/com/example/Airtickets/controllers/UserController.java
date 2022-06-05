package com.example.Airtickets.controllers;

import com.example.Airtickets.models.Ticket;
import com.example.Airtickets.models.User;
import com.example.Airtickets.services.TicketService;
import com.example.Airtickets.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final TicketService ticketService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @GetMapping("/user/{id}")
    public String user(@PathVariable Long id, Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        List<Ticket> userTickets = new ArrayList<>(user.getUserTickets());
        model.addAttribute("user", user);
        model.addAttribute("userTickets", userTickets);
        return "user-info";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }
}
