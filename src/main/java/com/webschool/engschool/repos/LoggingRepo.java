package com.webschool.engschool.repos;

import com.webschool.engschool.domain.Logging;
import org.springframework.data.jpa.repository.JpaRepository;


public interface LoggingRepo
        extends JpaRepository<Logging, Long> {

}