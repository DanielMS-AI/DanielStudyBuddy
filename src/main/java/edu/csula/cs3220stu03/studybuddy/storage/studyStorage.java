package edu.csula.cs3220stu03.studybuddy.storage;


import edu.csula.cs3220stu03.studybuddy.models.Flashcards;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.ArrayList;
@Component
public class studyStorage {

    private final List<Flashcards> flashcards;
    private final List<Quiz> quiz;

    public studyStorage() {
        //for testing hardcoding some questions and flashcards
        flashcards = new ArrayList<>();

        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));
        flashcards.add(new Flashcards("what is the mitochonria", "powerhouse of the cell"));

        quiz = new ArrayList<>();
        quiz.add(new Quiz("what is the mitochondria1", "powerhouse of the cell1", List.of("wrong1","wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria2", "powerhouse of the cell2", List.of("wrong1", "wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria3", "powerhouse of the cell3", List.of("wrong1","wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria4", "powerhouse of the cell4", List.of("wrong1", "wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria5", "powerhouse of the cell5", List.of("wrong1","wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria6", "powerhouse of the cell6", List.of("wrong1", "wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria7", "powerhouse of the cell7", List.of("wrong1","wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria8", "powerhouse of the cell8", List.of("wrong1", "wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria9", "powerhouse of the cell9", List.of("wrong1","wrong2", "wrong3")));
        quiz.add(new Quiz("what is the mitochondria10", "powerhouse of the cell10", List.of("wrong1", "wrong2", "wrong3")));
    }

    public List<Flashcards> getFlashcards() {
        return flashcards;
    }
    public List<Quiz> getQuiz() {
        return quiz;
    }
    public Flashcards getFlashcard(Integer flashcardID) {
        return flashcards.stream().filter(j -> j.getFlashcardID() == flashcardID).findFirst().orElse(null);
    }
    public Quiz getQuiz(Integer quizID) {
        return quiz.stream().filter(j -> j.getquizID() == quizID).findFirst().orElse(null);
    }


}
