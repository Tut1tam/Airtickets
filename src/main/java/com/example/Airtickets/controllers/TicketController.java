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
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TicketController {
    private final TicketService ticketService;
    private final UserService userService;

    @GetMapping("/")
    public String tickets(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("tickets", ticketService.listTickets(title));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "tickets";
    }

    @GetMapping("/ticket/{id}")
    public String ticketInfo(@PathVariable Long id, Principal principal, Model model){
        Ticket ticket = ticketService.getTicketById(id);
        model.addAttribute("ticket", ticket);
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "ticket-info";
    }

    @GetMapping("/ticket/{id}/buy")
    public String ticketBuy(@PathVariable Long id, Model model, Principal principal){
        Ticket ticket = ticketService.getTicketById(id);
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("ticket", ticket);
        model.addAttribute("user", user);
        return "ticket-buy";
    }

    @PostMapping("/ticket/{id}/buy")
    public String ticketBuy(@PathVariable Long id, Principal principal){
        User user = userService.getUserByPrincipal(principal);
        Ticket ticket = ticketService.getTicketById(id);
        userService.addTicketToUser(user, ticket);
        return "redirect:/user/"+user.getId();
    }

}