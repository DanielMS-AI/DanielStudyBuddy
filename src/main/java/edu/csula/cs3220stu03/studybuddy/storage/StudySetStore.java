package edu.csula.cs3220stu03.studybuddy.storage;

import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import edu.csula.cs3220stu03.studybuddy.models.StudySet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class StudySetStore {

    private final Map<Integer, List<StudySet>> userStudySets = new HashMap<>();
    private final Map<Integer, Integer> userNextId = new HashMap<>();

    public StudySet add(int userId, String filename, List<Flashcard> flashcards, List<Quiz> quizzes) {
        int nextId = userNextId.getOrDefault(userId, 1);
        StudySet set = new StudySet(nextId, filename, flashcards, quizzes);

        userStudySets.computeIfAbsent(userId, k -> new ArrayList<>()).add(set);
        userNextId.put(userId, nextId + 1);

        return set;
    }

    public List<StudySet> getAll(int userId) {
        return userStudySets.getOrDefault(userId, new ArrayList<>());
    }

    public StudySet findById(int userId, int id) {
        return getAll(userId).stream()
                .filter(set -> set.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public boolean delete(int userId, int id) {
        List<StudySet> sets = userStudySets.get(userId);
        if (sets == null) return false;

        boolean removed = sets.removeIf(set -> set.getId() == id);
        return removed;
    }
}