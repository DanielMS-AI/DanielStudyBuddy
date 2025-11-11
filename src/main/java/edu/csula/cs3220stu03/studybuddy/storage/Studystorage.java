package edu.csula.cs3220stu03.studybuddy.storage;


import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.ArrayList;
@Component
public class Studystorage {

    private List<Flashcard> flashcards;
    private List<Quiz> quizzes;

    public Studystorage() {

        flashcards = new ArrayList<>();

        quizzes = new ArrayList<>();

    }

    public List<Flashcard> getFlashcards() {
        return flashcards;
    }

    public List<Quiz> getQuizzes() {
        return quizzes;
    }
    public Flashcard getFlashcard(Integer flashcardID) {
        return flashcards.stream().filter(j -> j.getFlashcardID() == flashcardID).findFirst().orElse(null);
    }
    public Quiz getQuiz(Integer quizID) {
        return quizzes.stream().filter(j -> j.getquizID() == quizID).findFirst().orElse(null);
    }

    public void setQuizzes(List<Quiz> quizzes) {
        this.quizzes = quizzes != null ? quizzes : new ArrayList<>();
    }

    public void setFlashcards(List<Flashcard> flashcards) {
        this.flashcards = flashcards != null ? flashcards : new ArrayList<>();
    }

}
