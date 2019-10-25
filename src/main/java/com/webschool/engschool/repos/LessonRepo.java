package com.webschool.engschool.repos;

import com.webschool.engschool.domain.Lesson;
import com.webschool.engschool.domain.Student;
import com.webschool.engschool.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface LessonRepo
        extends JpaRepository<Lesson, Long> {
  List<Lesson> findByStudentOrderByLocalDateTime(Student student);
  List<Lesson> findByTeacherOrderByLocalDateTime(User teacher);
  List<Lesson> findByStudent(Student student);
  List<Lesson> findByTeacher(User teacher);


  @Query(value = "select avg(teacher_mark) from lesson where teacher_id=?1", nativeQuery = true)
  double avgTeacher (Long teacherID);

  @Query(value = "select avg(student_mark) from lesson where student_id=?1", nativeQuery = true)
  double avgStudent (Long studentID);
}