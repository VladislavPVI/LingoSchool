package com.webschool.engschool.repos;

import com.webschool.engschool.domain.Role;
import com.webschool.engschool.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    List<User> findByRoles(Role role);
    List<User> findByRolesAndLevel(Role role,int level);
    }
