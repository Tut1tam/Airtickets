package com.example.Airtickets.services;

import com.example.Airtickets.models.Ticket;
import com.example.Airtickets.models.User;
import com.example.Airtickets.repositories.TicketRepository;
import com.example.Airtickets.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TicketService {
    private final TicketRepository ticketRepository;
    private final UserRepository userRepository;

    private List<Ticket> tickets = new ArrayList<>();
    public List<Ticket> listTickets(String title) {
        if (title != null) return ticketRepository.findByTitle(title);
        return ticketRepository.findAll();
    }
    public void saveTicket(Ticket ticket) {
        log.info("Saving new Ticket. Title: {}", ticket.getTitle());
        Ticket ticketFromDb = ticketRepository.save(ticket);
        ticketRepository.save(ticket);
    }

    public void deleteTicket(Long id) {
        ticketRepository.deleteById(id);
    }
    public Ticket getTicketById(Long id) {
        return ticketRepository.findById(id).orElse(null);
    }
}