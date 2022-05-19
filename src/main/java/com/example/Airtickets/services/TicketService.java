package com.example.Airtickets.services;

import com.example.Airtickets.models.Ticket;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TicketService {
    private List<Ticket> tickets = new ArrayList<>();
    private long ID = 0;

    {
        tickets.add(new Ticket(++ID, "Победа", "18.05.2022", 23000, "Москва", "Сочи"));
        tickets.add(new Ticket(++ID, "Победа", "19.05.2022", 46000, "Сочи", "Москва"));

    }

    public List<Ticket> list() {
        return tickets;
    }

    public void saveTicket(Ticket ticket) {
        ticket.setId(++ID);
        tickets.add(ticket);
    }

    public void deleteTicket(Long id) {
        tickets.removeIf(ticket -> ticket.getId() == id);
    }

    public Ticket getTicketById(Long id) {
        for (Ticket ticket : tickets) {
            if (ticket.getId() == id) return ticket;
        }
        return null;
    }
}