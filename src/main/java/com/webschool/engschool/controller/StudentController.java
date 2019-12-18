package com.webschool.engschool.controller;

import com.webschool.engschool.domain.Lesson;
import com.webschool.engschool.domain.Student;
import com.webschool.engschool.repos.LessonRepo;
import com.webschool.engschool.repos.TaskRepo;
import com.webschool.engschool.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private TaskRepo taskRepo;
    @Autowired
    private LessonRepo lessonRepo;

    @GetMapping("/student-cab")
    @PreAuthorize("hasAuthority('STUDENT')")
    public String studentCabinet(@AuthenticationPrincipal Student user, Model model) {
        List<Lesson> lessons = lessonRepo.findByStudentOrderByLocalDateTime(user);
        LocalDateTime bliz = null;
        if (!lessons.isEmpty()) {
            for (Lesson lesson : lessons) {
                if (LocalDateTime.now().isBefore(lesson.getLocalDateTime())) {
                    bliz = lesson.getLocalDateTime();
                    break;
                }
            }
            model.addAttribute("avg", lessonRepo.avgStudent(user.getId()));
        } else model.addAttribute("avg", "Дождись первого занятия :)");
        model.addAttribute("bliz", bliz);
        model.addAttribute("user", user);
        Long teacherID = user.getTeacherID();
        if (teacherID != null)
            model.addAttribute("teacher", userRepo.getOne(teacherID).getFullname());
        else model.addAttribute("teacher", "У вас нет учителя!");
        Long task = user.getTask();
        if (task != null && taskRepo.existsById(task)) {
            model.addAttribute("tasks", taskRepo.getOne(task));
        } else model.addAttribute("tasks", null);
        model.addAttribute("lessons", lessons);
        return "studentCabinet";
    }

    @GetMapping("/student-cab/{lesson}/{mark}")
    @PreAuthorize("hasAuthority('STUDENT')")
    public String addMark(
            @PathVariable Lesson lesson,
            @PathVariable int mark) {
        lesson.setTeacherMark(mark);
        lessonRepo.save(lesson);
        return "redirect:/student-cab/";
    }

}
