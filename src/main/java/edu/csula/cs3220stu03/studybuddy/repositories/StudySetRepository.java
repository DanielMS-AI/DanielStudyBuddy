package edu.csula.cs3220stu03.studybuddy.repositories;

import edu.csula.cs3220stu03.studybuddy.models.StudySet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudySetRepository extends JpaRepository<StudySet, Integer> {
    List<StudySet> findByUserId(int userId);
}
