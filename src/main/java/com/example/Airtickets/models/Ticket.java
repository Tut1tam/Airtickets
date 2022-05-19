package com.example.Airtickets.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Ticket {
    private long Id;
    private String title;
    private String date;
    private int price;
    private String from_where;
    private String to_where;
}
