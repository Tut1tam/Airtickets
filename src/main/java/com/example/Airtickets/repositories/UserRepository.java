package com.example.Airtickets.repositories;

import com.example.Airtickets.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository {
    User findByEmail(String email);
}
