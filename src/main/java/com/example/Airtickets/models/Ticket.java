package com.example.Airtickets.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "tickets")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "title")
    private String title;

    @Column(name = "date")
    private String date;

    @Column(name = "price")
    private int price;

    @Column(name = "from_where")
    private String from_where;

    @Column(name = "to_where")
    private String to_where;
}