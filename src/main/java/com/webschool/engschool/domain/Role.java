package com.webschool.engschool.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ADMIN, EDITOR, STUDENT, TEACHER;

    @Override
    public String getAuthority() {
        return name();
    }
}
