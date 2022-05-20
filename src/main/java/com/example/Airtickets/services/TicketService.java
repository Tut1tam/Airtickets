package com.example.Airtickets.services;

import com.example.Airtickets.models.Image;
import com.example.Airtickets.models.Ticket;
import com.example.Airtickets.models.User;
import com.example.Airtickets.repositories.TicketRepository;
import com.example.Airtickets.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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
    public void saveTicket(Ticket ticket, MultipartFile file1, MultipartFile file2) throws IOException {
        Image image1;
        Image image2;
        if (file1.getSize() != 0){
            image1 = toImageEntity(file1);
            ticket.addImageToTicket(image1);
        }
        if (file2.getSize() != 0){
            image2 = toImageEntity(file2);
            ticket.addImageToTicket(image2);
        }

        log.info("Saving new Ticket. Title: {}", ticket.getTitle());
        Ticket ticketFromDb = ticketRepository.save(ticket);
        ticketFromDb.setPreviewImageId(ticketFromDb.getImages().get(0).getId());
        ticketRepository.save(ticket);
    }

    public User getUserByPrincipal(Principal principal){
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteTicket(Long id) {
        ticketRepository.deleteById(id);
    }
    public Ticket getTicketById(Long id) {
        return ticketRepository.findById(id).orElse(null);
    }
}