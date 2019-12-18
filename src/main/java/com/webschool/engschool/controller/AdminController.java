package com.webschool.engschool.controller;

import com.webschool.engschool.domain.Email;
import com.webschool.engschool.domain.Role;
import com.webschool.engschool.domain.Student;
import com.webschool.engschool.domain.User;
import com.webschool.engschool.repos.LessonRepo;
import com.webschool.engschool.repos.StudentRepo;
import com.webschool.engschool.repos.UserRepo;
import com.webschool.engschool.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private UserService userService;

    @Autowired
    private LessonRepo lessonRepo;

    @Autowired
    private StudentRepo studentRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JmsTemplate jmsTemplate;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userRepo.findAll());
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("userEdit", user);
        model.addAttribute("roles", Role.values());
        model.addAttribute("users", userRepo.findAll());
        return "userList";
    }

    @GetMapping("delete/{user}")
    public String userDeleteForm(@PathVariable User user) {
        for (Role role : user.getRoles()) {
            if (role.equals(Role.TEACHER)) {
                lessonRepo.deleteAll(lessonRepo.findByTeacher(user));
                for (Student student : studentRepo.findByTeacherID(user.getId()))
                    student.setTeacherID(null);
                break;
            } else if (role.equals(Role.STUDENT))
                lessonRepo.deleteAll(lessonRepo.findByStudent((Student) user));
        }
        jmsTemplate.convertAndSend("sendEmail", new Email("otori86@gmail.com", user.getFullname(), getCurrentUsername()));
        userRepo.delete(user);
        return "redirect:/user";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam String newrole,
            @RequestParam("userID") User user,
            @RequestParam(defaultValue = "false") Boolean active
    ) {
        user.setActive(active);
        user.setUsername(username);
        if (!user.getRoles().contains(Role.STUDENT)) {
            user.getRoles().clear();
            user.getRoles().add(Role.valueOf(newrole));
        }

        userRepo.save(user);
        return "redirect:/user";
    }

    @GetMapping("registration")
    public String registration(Model model) {
        model.addAttribute("roles", Role.values());
        return "registrationT";
    }

    @PostMapping("registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
            model.put("roles", Role.values());
            model.put("message", "Пользователь существует!");
            return "registrationT";
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.YYYY");
        LocalDate date = LocalDate.parse(user.getBirthd());
        user.setBirthd(formatter.format(date));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        if (user.getRoles().contains(Role.STUDENT)) {
            user = new Student(user);
            userRepo.save(user);
        } else userRepo.save(user);

        return "redirect:/user";
    }

    public String getCurrentUsername() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }

}
