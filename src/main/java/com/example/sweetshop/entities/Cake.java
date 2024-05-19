package com.example.sweetshop.entities;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cakes")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cake {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "price")
    private int price;
    @Column(name = "being")
    private int being;

    @OneToMany(mappedBy = "cake", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    List<Basket> basketList = new ArrayList<>();

    @OneToMany(mappedBy = "cake", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    List<Order> orderList = new ArrayList<>();
}
