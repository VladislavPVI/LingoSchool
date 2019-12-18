package com.webschool.engschool.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Logging {
    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO,
            generator = "native"
    )
    @GenericGenerator(
            name = "native",
            strategy = "native"
    )
    private Long id;

    private String kindOfChange;
    private String nameOfClass;
    private String changes;

    public Logging() {
    }

    public Logging(String kindOfChange, String nameOfClass, String changes) {
        this.kindOfChange = kindOfChange;
        this.nameOfClass = nameOfClass;
        this.changes = changes;
    }

    public Logging(String kindOfChange, String nameOfClass) {
        this.kindOfChange = kindOfChange;
        this.nameOfClass = nameOfClass;
    }

    public String getKindOfChange() {
        return kindOfChange;
    }

    public void setKindOfChange(String kindOfChange) {
        this.kindOfChange = kindOfChange;
    }

    public String getNameOfClass() {
        return nameOfClass;
    }

    public void setNameOfClass(String nameOfClass) {
        this.nameOfClass = nameOfClass;
    }

    public String getChanges() {
        return changes;
    }

    public void setChanges(String changes) {
        this.changes = changes;
    }
}
