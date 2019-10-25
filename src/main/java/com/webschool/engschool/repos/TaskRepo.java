package com.webschool.engschool.repos;

import com.webschool.engschool.domain.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TaskRepo extends JpaRepository<Task, Long> {
    List<Task> findByLevel(int level);
    List<Task> findByType(String type);
    List<Task> findByLevelAndType(int level, String type);

}
