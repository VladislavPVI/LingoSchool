package com.webschool.engschool.repos;

import com.webschool.engschool.domain.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepo extends JpaRepository<Student, Long> {
      List<Student> findByTeacherID(Long teacherID);


}
