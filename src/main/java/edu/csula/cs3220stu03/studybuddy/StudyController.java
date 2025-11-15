package edu.csula.cs3220stu03.studybuddy;

import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import edu.csula.cs3220stu03.studybuddy.models.StudySet;
import edu.csula.cs3220stu03.studybuddy.storage.StudySetStore;
import edu.csula.cs3220stu03.studybuddy.storage.UserSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class StudyController {

    private final StudySetStore studySetStore;
    private final UserSession userSession;

    public StudyController(StudySetStore studySetStore, UserSession userSession) {
        this.studySetStore = studySetStore;
        this.userSession = userSession;
    }

    @GetMapping("/quiz/{studySetId}/{number}")
    public String showQuestion(
            @PathVariable int studySetId,
            @PathVariable int number,
            @RequestParam(defaultValue = "0") int score,
            Model model
    ) {
        int userId = userSession.getUserId();
        StudySet set = studySetStore.findById(userId, studySetId);
        if (set == null) return "redirect:/allnotes";

        List<Quiz> questions = set.getQuizzes();
        if (number < 1 || number > questions.size()) return "redirect:/allnotes";

        Quiz q = questions.get(number - 1);

        List<String> options = new ArrayList<>(q.getResponses());
        if (!options.contains(q.getAnswer())) options.add(q.getAnswer());
        Collections.shuffle(options);

        model.addAttribute("fileTitle", set.getFilename());
        model.addAttribute("setId", studySetId);
        model.addAttribute("number", number);
        model.addAttribute("total", questions.size());
        model.addAttribute("question", q.getQuestion());
        model.addAttribute("options", options);
        model.addAttribute("answer", q.getAnswer());
        model.addAttribute("score", score);
        return "quiz";
    }
    @PostMapping("/quiz/{studySetId}/{number}")
    public String submitAnswer(
            @PathVariable int studySetId,
            @PathVariable int number,
            @RequestParam("choice") String choice,
            @RequestParam("correct") String correct,
            @RequestParam("score") int score
    ) {
        if (choice.equals(correct)) score++;
        int userId = userSession.getUserId();
        StudySet set = studySetStore.findById(userId, studySetId);
        if (set == null) return "redirect:/allnotes";

        if (number < set.getQuizzes().size()) {
            return "redirect:/quiz/" + studySetId + "/" + (number + 1) + "?score=" + score;
        } else {
            return "redirect:/quiz/results/" + studySetId + "?score=" + score;
        }
    }

    @GetMapping("/quiz/results/{studySetId}")
    public String results(@PathVariable int studySetId, @RequestParam int score, Model model) {
        int userId = userSession.getUserId();
        StudySet set = studySetStore.findById(userId, studySetId);
        if (set == null) return "redirect:/allnotes";
        model.addAttribute("score", score);
        model.addAttribute("total", set.getQuizzes().size());
        model.addAttribute("studySetId", studySetId);
        model.addAttribute("fileTitle", set.getFilename());
        model.addAttribute("allquizzes", set.getQuizzes());

        return "quiz_results";
    }
    @GetMapping("/flashcards/{studySetId}")
    public String showFlashcard(@PathVariable int studySetId, Model model) {
        if (!userSession.isLoggedIn()) return "redirect:/login";

        int userId = userSession.getUserId();
        StudySet set = studySetStore.findById(userId, studySetId);
        if (set == null) return "redirect:/allnotes";

        List<Flashcard> flashcards = set.getFlashcards();
        model.addAttribute("fileTitle", set.getFilename());
        model.addAttribute("setId", studySetId);
        model.addAttribute("total", flashcards.size());
        model.addAttribute("flashcards", flashcards);

        return "flashcards";
    }

    @GetMapping("/delete/{studySetId}")
    public String deleteStudySet(@PathVariable int studySetId) {
        if (!userSession.isLoggedIn()) return "redirect:/login";

        int userId = userSession.getUserId();
        studySetStore.delete(userId, studySetId);

        return "redirect:/allnotes";
    }
}