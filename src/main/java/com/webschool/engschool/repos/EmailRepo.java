package com.webschool.engschool.repos;

import com.webschool.engschool.domain.Email;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmailRepo extends JpaRepository<Email, Long> {
}
