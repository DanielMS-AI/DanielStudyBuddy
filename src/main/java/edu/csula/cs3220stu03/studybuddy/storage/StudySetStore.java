package edu.csula.cs3220stu03.studybuddy.storage;


import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import edu.csula.cs3220stu03.studybuddy.models.StudySet;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;


@Component
public class StudySetStore {

    private List<StudySet> studySets = new ArrayList<>();
    private int nextId = 1;

    public StudySet add(String filename, List<Flashcard> flashcards, List<Quiz> quizzes) {
        StudySet set = new StudySet(nextId++, filename, flashcards, quizzes);
        studySets.add(set);
        return set;
    }

    public List<StudySet> getAll() {
        return studySets;
    }

    public StudySet findById(int id) {
        for (StudySet set : studySets) {
            if (set.getId() == id) {
                return set;
            }
        }
        return null;
    }
}