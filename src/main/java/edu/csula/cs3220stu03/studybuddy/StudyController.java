package edu.csula.cs3220stu03.studybuddy;


import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import edu.csula.cs3220stu03.studybuddy.models.StudySet;
import edu.csula.cs3220stu03.studybuddy.storage.StudySetStore;
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

    public StudyController(StudySetStore studySetStore) {
        this.studySetStore = studySetStore;
    }
    @GetMapping("/quiz/{studySetId}/{number}")
    public String showQuestion(
            @PathVariable int studySetId,
            @PathVariable int number,
            @RequestParam(defaultValue = "0") int score,
            Model model
    ) {
        StudySet set = studySetStore.findById(studySetId);
        if (set == null) return "redirect:/studysets";

        List<Quiz> questions = set.getQuizzes();
        if (number < 1 || number > questions.size()) return "redirect:/studysets";

        Quiz q = questions.get(number - 1);

        List<String> options = new ArrayList<>(q.getResponses());
        if (!options.contains(q.getAnswer())) options.add(q.getAnswer());
        Collections.shuffle(options);

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

        StudySet set = studySetStore.findById(studySetId);
        if (set == null) return "redirect:/studysets";

        if (number < set.getQuizzes().size()) {
            return "redirect:/quiz/" + studySetId + "/" + (number + 1) + "?score=" + score;
        } else {
            return "redirect:/quiz/results/" + studySetId + "?score=" + score;
        }
    }

    @GetMapping("/quiz/results/{studySetId}")
    public String results(@PathVariable int studySetId, @RequestParam int score, Model model) {
        StudySet set = studySetStore.findById(studySetId);
        if (set == null) return "redirect:/studysets";
        model.addAttribute("score", score);
        model.addAttribute("total", set.getQuizzes().size());
        model.addAttribute("studySetId", studySetId);
        return "quiz_results";
    }


}