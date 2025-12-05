package edu.csula.cs3220stu03.studybuddy.repositories;

import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizRepository extends JpaRepository<Quiz, Integer> {
    List<Quiz> findByStudySetId(int studySetId);
}
