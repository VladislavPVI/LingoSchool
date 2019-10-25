package com.webschool.engschool.controller;

import com.webschool.engschool.domain.Role;
import com.webschool.engschool.domain.Student;
import com.webschool.engschool.domain.User;
import com.webschool.engschool.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController
{
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration()
    {
        return "registration";
    }


    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/registration")
    public  String addUser(Student student, Map<String, Object> model, RedirectAttributes redirectAttributes)
    {
        User userFromDb = userRepo.findByUsername(student.getUsername());
        if (userFromDb != null)
        {
            model.put("message", "Пользователь существует!");
            return "registration";
        }

        student.setRoles(Collections.singleton(Role.STUDENT));
        student.setActive(true);
        student.setPassword(passwordEncoder.encode(student.getPassword()));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.YYYY");
        LocalDate date = LocalDate.parse(student.getBirthd());
        student.setBirthd(formatter.format(date));
        userRepo.save(student);
        redirectAttributes.addFlashAttribute("success", "true");
        return "redirect:/login";
    }
}
