package com.webschool.engschool.domain;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class Task{
    @Id
    @GeneratedValue(
            strategy= GenerationType.AUTO,
            generator="native"
    )
    @GenericGenerator(
            name = "native",
            strategy = "native"
    )
    private Long id;

    @NotBlank(message = "Пожалуйста, заполни поле!")
    @Length(max =2048, message = "Слишком большое задание!")
    private String text;

    @NotBlank(message = "Пожалуйста, заполни поле!")
    private String taskname;
    @NotBlank(message = "Пожалуйста, заполни поле!")
    private String type;
    @NotNull
    private int level;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User author;
    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }



    public Task() {
    }

    public Task(String text, String taskname, int level, User author) {
        this.text = text;
        this.taskname = taskname;
        this.level = level;
        this.author = author;
    }

    public String getAuthorName(){
        return  author != null? author.getUsername() : "<none>";
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

        public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

   }
