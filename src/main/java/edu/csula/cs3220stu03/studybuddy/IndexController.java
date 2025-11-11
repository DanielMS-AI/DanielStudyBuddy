package edu.csula.cs3220stu03.studybuddy;

import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import edu.csula.cs3220stu03.studybuddy.storage.StudyStorage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

@Controller
public class IndexController {
    private StudyStorage studystorage;

    public IndexController(StudyStorage studystorage) {
        this.studystorage = studystorage;
    }

/*
    @RequestMapping("/")
    public String landing() {
        return "landing";
    }
*/

    @GetMapping("/quiz/{number}")
    public String Quiz(@PathVariable("number") int counter, Model model){

        List <Quiz> quizList = studystorage.getQuizzes();
        Quiz currentQuiz = quizList.get(counter-1);

        if (counter < 1 || counter > quizList.size()) {
            return "redirect:/quizanswers";
        }

        List<String> options = new ArrayList<>(currentQuiz.getResponses());
        options.add(currentQuiz.getAnswer());
        Collections.shuffle(options);

        model.addAttribute("questionNumber", counter);
        model.addAttribute("questionText", currentQuiz.getQuestion());
        model.addAttribute("options", options);
        model.addAttribute("answer", currentQuiz.getAnswer());
        model.addAttribute("quizTitle", "Biology"); //hardcoded for now will adjust

        return "quiz";
    }

}
