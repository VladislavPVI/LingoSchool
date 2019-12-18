package com.webschool.engschool.controller;

import com.webschool.engschool.domain.Lesson;
import com.webschool.engschool.domain.Student;
import com.webschool.engschool.domain.User;
import com.webschool.engschool.repos.LessonRepo;
import com.webschool.engschool.repos.StudentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@PreAuthorize("hasAuthority('TEACHER')")
@RequestMapping("/teacherCab")
public class TeacherController {
    @Autowired
    StudentRepo studentsRepo;
    @Autowired
    LessonRepo lessonRepo;


    @GetMapping
    public String userList(Model model, @AuthenticationPrincipal User user) {
        List<Lesson> lessons = lessonRepo.findByTeacherOrderByLocalDateTime(user);
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime bliz = null;

        if (!lessons.isEmpty()) {
            for (Lesson lesson : lessons) {
                if (now.isBefore(lesson.getLocalDateTime())) {
                    bliz = lesson.getLocalDateTime();
                    break;
                }
            }
            model.addAttribute("avg", lessonRepo.avgTeacher(user.getId()));
        } else model.addAttribute("avg", "Дождись первого занятия :)");

        model.addAttribute("students", studentsRepo.findByTeacherID(user.getId()));
        model.addAttribute("bliz", bliz);
        model.addAttribute("now", now);
        model.addAttribute("lessons", lessons);
        model.addAttribute("user", user);
        return "teacherCabinet";
    }

    @PostMapping
    public String add(@AuthenticationPrincipal User user,
                      @RequestParam Student currentStudent,
                      @RequestParam String timeoflesson) {
        Lesson lesson = new Lesson(
                LocalDateTime.parse(timeoflesson), currentStudent, user);

        lessonRepo.save(lesson);
        return "redirect:/teacherCab";
    }

    @GetMapping("/lesson/{lesson}/{mark}")
    public String addMark(
            @PathVariable Lesson lesson,
            @PathVariable int mark) {
        lesson.setStudentMark(mark);
        lessonRepo.save(lesson);
        return "redirect:/teacherCab";
    }

    @GetMapping("/delete/{lesson}")
    public String deleteLesson(
            @PathVariable Lesson lesson) {
        lessonRepo.delete(lesson);
        return "redirect:/teacherCab";
    }

}


