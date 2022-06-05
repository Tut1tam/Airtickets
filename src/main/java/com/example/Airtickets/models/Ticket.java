package com.example.Airtickets.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tickets")
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

    @ManyToMany(mappedBy = "userTickets")
    private Set<User> users = new HashSet<>();

    public Ticket(){

    }
    public Ticket(String title, String date, int price, String from_where, String to_where) {
        this.title = title;
        this.date = date;
        this.price = price;
        this.from_where = from_where;
        this.to_where = to_where;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getFrom_where() {
        return from_where;
    }

    public void setFrom_where(String from_where) {
        this.from_where = from_where;
    }

    public String getTo_where() {
        return to_where;
    }

    public void setTo_where(String to_where) {
        this.to_where = to_where;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}