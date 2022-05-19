package com.example.Airtickets.repositories;

import com.example.Airtickets.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Long> {
}
