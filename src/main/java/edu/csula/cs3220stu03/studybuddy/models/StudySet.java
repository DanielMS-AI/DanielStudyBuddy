package edu.csula.cs3220stu03.studybuddy.models;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class StudySet {
    private Integer id;
    private String filename;
    private List<Flashcard> flashcards = new ArrayList<>();
    private List<Quiz> quizzes = new ArrayList<>();

    public StudySet() {}

    public StudySet(Integer id, String filename, List<Flashcard> flashcards, List<Quiz> quizzes) {
        this.id = id;
        this.filename = filename;
        if (flashcards != null) this.flashcards = flashcards;
        if (quizzes != null) this.quizzes = quizzes;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getFilename() { return filename; }
    public void setFilename(String filename) { this.filename = filename; }

    public List<Flashcard> getFlashcards() { return flashcards; }
    public void setFlashcards(List<Flashcard> flashcards) { this.flashcards = flashcards; }

    public List<Quiz> getQuizzes() { return quizzes; }
    public void setQuizzes(List<Quiz> quizzes) { this.quizzes = quizzes; }
}