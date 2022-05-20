package com.example.Airtickets.controllers;

import com.example.Airtickets.models.Ticket;
import com.example.Airtickets.services.TicketService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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
    public String ticketInfo(@PathVariable Long id, Model model){
        Ticket ticket = ticketService.getTicketById(id);
        model.addAttribute("ticket", ticket);
        model.addAttribute("images", ticket.getImages());
        return "ticket-info";
    }

    @PostMapping("/ticket/create")
    public String createTicket(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                               Ticket ticket) throws IOException {
        ticketService.saveTicket(ticket, file1, file2);
        return "redirect:/";
    }

    @PostMapping("/ticket/delete/{id}")
    public String deleteTicket(@PathVariable Long id){
        ticketService.deleteTicket(id);
        return "redirect:/";
    }
}