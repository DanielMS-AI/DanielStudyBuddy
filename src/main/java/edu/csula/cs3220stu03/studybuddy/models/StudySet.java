package edu.csula.cs3220stu03.studybuddy.models;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "study_sets")
public class StudySet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String title;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @OneToMany(mappedBy = "studySet", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Quiz> quizzes;

    @OneToMany(mappedBy = "studySet", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Flashcard> flashcards;

    public StudySet() {}

    public StudySet(String title, User user, List<Quiz> quizzes, List<Flashcard> flashcards) {
        this.title = title;
        this.user = user;
        this.quizzes = quizzes;
        this.flashcards = flashcards;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public List<Quiz> getQuizzes() {
        return quizzes;
    }
    public void setQuizzes(List<Quiz> quizzes) {
        this.quizzes = quizzes;
    }

    public List<Flashcard> getFlashcards() {
        return flashcards;
    }
    public void setFlashcards(List<Flashcard> flashcards) {
        this.flashcards = flashcards;
    }
}
