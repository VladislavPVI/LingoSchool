package com.webschool.engschool.controller;

import com.webschool.engschool.domain.Role;
import com.webschool.engschool.domain.Student;
import com.webschool.engschool.domain.User;
import com.webschool.engschool.repos.StudentRepo;
import com.webschool.engschool.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student")
@PreAuthorize("hasAuthority('ADMIN') OR hasAuthority('EDITOR')")
public class EditorController
{
    @Autowired
    private StudentRepo studentRepo;

    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("students", studentRepo.findAll());
        return "studentList";
    }

    @GetMapping("{student}")
    public String userEditForm(@RequestParam(required = false, defaultValue = "0") int filter,
                               @PathVariable Student student, Model model)
    {
        model.addAttribute("user", student);
        if (student.getTeacherID() != null)
            model.addAttribute("current", userRepo.getOne(student.getTeacherID()).getFullname());
        else model.addAttribute("current", "Not found");
        if (filter==0)
        model.addAttribute("teachers", userRepo.findByRoles(Role.TEACHER));
        else
            model.addAttribute("teachers", userRepo.findByRolesAndLevel(Role.TEACHER,filter));
        return "studentEdit";
    }

    @GetMapping("{user}/{teacher}")
    public String userSave(
            @PathVariable Student user,
            @PathVariable User teacher
    )
    {
        user.setTeacherID(teacher.getId());
        studentRepo.save(user);
        return "redirect:/student";
    }

}
