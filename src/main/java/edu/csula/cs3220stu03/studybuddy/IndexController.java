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
        return "quiz";
    }
*/

}
