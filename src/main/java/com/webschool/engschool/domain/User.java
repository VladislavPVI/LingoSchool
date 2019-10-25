package com.webschool.engschool.domain;

import com.webschool.engschool.repos.LessonRepo;
import com.webschool.engschool.repos.TaskRepo;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Collection;
import java.util.Set;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class User implements UserDetails {
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

    @NotBlank(message = "Заполни логин!")
    private String username;
    @NotBlank(message = "Заполни пароль!")
    private String password;
    private boolean active;
    @NotBlank(message = "Заполни ДР!")
    private String birthd;
    @NotBlank(message = "Заполни ФИО!")
    private String fullname;
    @NotNull
    private int level;
    private String preferences;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    public User() {
    }
    public User(User user) {
        this.username = user.username;
        this.password = user.password;
        this.active = user.active;
        this.birthd = user.birthd;
        this.fullname = user.fullname;
        this.level = user.level;
        this.preferences = user.preferences;
        this.roles = user.roles;
    }

    public boolean isadmin(){
        return roles.contains(Role.ADMIN);
    }
    public boolean isteacher(){
        return roles.contains(Role.TEACHER);
    }
    public boolean iseditor(){
        return roles.contains(Role.EDITOR);
    }
    public boolean isstudent(){
        return roles.contains(Role.STUDENT);
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
    public String getBirthd() {
        return birthd;
    }

    public void setBirthd(String birthd) {
        this.birthd = birthd;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
    public String getPreferences() {
        return preferences;
    }

    public void setPreferences(String preferences) {
        this.preferences = preferences;
    }





}
