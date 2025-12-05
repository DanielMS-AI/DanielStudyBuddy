package edu.csula.cs3220stu03.studybuddy.repositories;

import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlashcardRepository extends JpaRepository<Flashcard, Integer> {
    List<Flashcard> findByStudySetId(int studySetId);
}
