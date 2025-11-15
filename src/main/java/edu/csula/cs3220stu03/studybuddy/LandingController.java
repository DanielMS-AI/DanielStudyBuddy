package edu.csula.cs3220stu03.studybuddy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LandingController {
    @GetMapping("/landing")
    public String landing() {
        return "landing";
    }
}
