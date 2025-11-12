package edu.csula.cs3220stu03.studybuddy;

import edu.csula.cs3220stu03.studybuddy.storage.Studystorage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class IndexController {
    private Studystorage studystorage;

    public IndexController(Studystorage studystorage) {
        this.studystorage = studystorage;
    }


    @RequestMapping("/")
    public String landing() {
        return "upload";
    }


}
