package com.example.Airtickets.controllers;

import com.example.Airtickets.models.Ticket;
import com.example.Airtickets.services.TicketService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class TicketController {
    private final TicketService ticketService;

    @GetMapping("/")
    public String tickets(Model model) {
        model.addAttribute("tickets", ticketService.list());
        return "tickets";
    }

    @GetMapping("/ticket/{id}")
    public String ticketInfo(@PathVariable Long id, Model model){
        model.addAttribute("ticket", ticketService.getTicketById(id));
        return "ticket-info";
    }

    @PostMapping("/ticket/create")
    public String createTicket(Ticket ticket) {
        ticketService.saveTicket(ticket);
        return "redirect:/";
    }

    @PostMapping("/ticket/delete/{id}")
    public String deleteTicket(@PathVariable Long id){
        ticketService.deleteTicket(id);
        return "redirect:/";
    }
}