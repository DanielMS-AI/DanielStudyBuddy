package edu.csula.cs3220stu03.studybuddy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;
@Controller
public class IndexController {

    @RequestMapping("/")
    public String landing() {
        return "landing";
    }

}
