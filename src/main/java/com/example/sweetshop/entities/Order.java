package com.example.sweetshop.entities;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @ManyToOne
    @JoinColumn(name = "cakeId")
    private Cake cake;
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;
    @Column(name = "dateOfCreated")
    private LocalDateTime dateOfCreated;
    @Column(name = "active")
    private boolean active;

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }
}
