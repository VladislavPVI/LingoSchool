package com.webschool.engschool.controller;

import com.webschool.engschool.domain.Logging;
import com.webschool.engschool.domain.Student;
import com.webschool.engschool.domain.Task;
import com.webschool.engschool.domain.User;
import com.webschool.engschool.repos.StudentRepo;
import com.webschool.engschool.repos.TaskRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;


@Controller
public class TaskController {
    @Autowired
    private TaskRepo taskRepo;

    @Autowired
    private StudentRepo studentRepo;

    @Autowired
    private JmsTemplate jmsTemplate;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/main")
    @PreAuthorize("hasAuthority('ADMIN') OR hasAuthority('EDITOR')  OR hasAuthority('TEACHER')")
    public String main(@RequestParam(required = false, defaultValue = "0") int filter,
                       @RequestParam(required = false, defaultValue = "") String type,
                       @AuthenticationPrincipal User user, Model model) {

        Iterable<Task> tasks;
        if (type != null && !type.isEmpty() && filter != 0)
            tasks = taskRepo.findByLevelAndType(filter, type);
        else if (type != null && !type.isEmpty())
            tasks = taskRepo.findByType(type);
        else if (filter != 0)
            tasks = taskRepo.findByLevel(filter);
        else
            tasks = taskRepo.findAll();
        model.addAttribute("tasks", tasks);

        Iterable<Student> students;
        students = studentRepo.findByTeacherID(user.getId());
        model.addAttribute("students", students);
        return "main";
    }

    @PreAuthorize("hasAuthority('ADMIN') OR hasAuthority('EDITOR')  OR hasAuthority('TEACHER')")
    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Task task,
            BindingResult bindingResult,
            Model model) throws IOException {


        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("task", task);
        } else {
            task.setAuthor(user);
            model.addAttribute("task", null);
            taskRepo.save(task);
            jmsTemplate.convertAndSend("editTask", new Logging("create", task.getTaskname(), task.getText()));
        }
        Iterable<Task> tasks = taskRepo.findAll();
        model.addAttribute("tasks", tasks);
        Iterable<Student> students;
        students = studentRepo.findByTeacherID(user.getId());
        model.addAttribute("students", students);
        return "main";
    }

    @PreAuthorize("hasAuthority('ADMIN') OR hasAuthority('EDITOR')  OR hasAuthority('TEACHER')")
    @GetMapping("/tasks/{task}")
    public String editTask(@AuthenticationPrincipal User user, @PathVariable Task task, Model model) {

        model.addAttribute("task", task);
        Iterable<Task> tasks = taskRepo.findAll();
        model.addAttribute("tasks", tasks);
        Iterable<Student> students;
        students = studentRepo.findByTeacherID(user.getId());
        model.addAttribute("students", students);
        return "main";
    }

    @PreAuthorize("hasAuthority('ADMIN') OR hasAuthority('EDITOR')  OR hasAuthority('TEACHER')")
    @GetMapping("/delete/{task}")
    public String deleteTask(@PathVariable Task task) {
        jmsTemplate.convertAndSend("editTask", new Logging("delete", task.getTaskname()));
        taskRepo.delete(task);
        return "redirect:/main";
    }

    @PreAuthorize("hasAuthority('TEACHER')")
    @GetMapping("/students/{student}/tasks/{task}")
    public String deleteTask(
            @PathVariable Student student,
            @PathVariable Long task) {
        student.setTask(task);
        studentRepo.save(student);
        return "redirect:/main";
    }

    @PreAuthorize("hasAuthority('ADMIN') OR hasAuthority('EDITOR')  OR hasAuthority('TEACHER')")
    @PostMapping("/tasks/{task}")
    public String updateTask(
            @AuthenticationPrincipal User currentUser,
            @RequestParam("id") Task task,
            @RequestParam("text") String text,
            @RequestParam("taskname") String taskname,
            @RequestParam("level") int level
    ) {
        task.setAuthor(currentUser);
        task.setTaskname(taskname);
        task.setText(text);
        task.setLevel(level);
        jmsTemplate.convertAndSend("editTask", new Logging("update", task.getTaskname(), task.getText()));
        taskRepo.save(task);
        return "redirect:/main";
    }

}