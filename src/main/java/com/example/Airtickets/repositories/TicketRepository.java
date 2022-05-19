package com.example.Airtickets.repositories;

import com.example.Airtickets.models.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
    List<Ticket> findByTitle(String title);
}
