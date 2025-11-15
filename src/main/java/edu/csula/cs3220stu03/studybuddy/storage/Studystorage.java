package edu.csula.cs3220stu03.studybuddy.storage;

import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class Studystorage {

    private final Map<Integer, List<Flashcard>> userFlashcards = new HashMap<>();
    private final Map<Integer, List<Quiz>> userQuizzes = new HashMap<>();

    public List<Flashcard> getFlashcards(int userId) {
        return userFlashcards.getOrDefault(userId, new ArrayList<>());
    }

    public List<Quiz> getQuizzes(int userId) {
        return userQuizzes.getOrDefault(userId, new ArrayList<>());
    }

    public Flashcard getFlashcard(int userId, Integer flashcardID) {
        return getFlashcards(userId).stream()
                .filter(f -> f.getFlashcardID().equals(flashcardID))
                .findFirst()
                .orElse(null);
    }

    public Quiz getQuiz(int userId, Integer quizID) {
        return getQuizzes(userId).stream()
                .filter(q -> q.getquizID().equals(quizID))
                .findFirst()
                .orElse(null);
    }

    public void setFlashcards(int userId, List<Flashcard> flashcards) {
        userFlashcards.put(userId, flashcards != null ? flashcards : new ArrayList<>());
    }

    public void setQuizzes(int userId, List<Quiz> quizzes) {
        userQuizzes.put(userId, quizzes != null ? quizzes : new ArrayList<>());
    }
}