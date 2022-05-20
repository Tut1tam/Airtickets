package com.example.Airtickets.controllers;

import com.example.Airtickets.models.Ticket;
import com.example.Airtickets.services.TicketService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TicketController {
    private final TicketService ticketService;
    @GetMapping("/")
    public String tickets(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("tickets", ticketService.listTickets(title));
        model.addAttribute("user", ticketService.getUserByPrincipal(principal));
        return "tickets";
    }
    @GetMapping("/ticket/{id}")
    public String ticketInfo(@PathVariable Long id, Principal principal, Model model){
        Ticket ticket = ticketService.getTicketById(id);
        model.addAttribute("ticket", ticket);
        model.addAttribute("user", ticketService.getUserByPrincipal(principal));
        return "ticket-info";
    }
}