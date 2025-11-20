package edu.csula.cs3220stu03.studybuddy;

import edu.csula.cs3220stu03.studybuddy.models.User;
import edu.csula.cs3220stu03.studybuddy.storage.UserSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

    private static final List<User> users = new ArrayList<>();
    private static int nextId = 1;

    private final UserSession userSession;

    public LoginController(UserSession userSession) {
        this.userSession = userSession;
    }

    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false) String error, Model model) {
        model.addAttribute("error", error);
        return "login"; // JTE template
    }

    @PostMapping("/login")
    public String loginPost(@RequestParam String username,
                            @RequestParam String password,
                            @RequestParam String action,
                            Model model) {

        if ("signup".equals(action)) {
            for (User u : users) {
                if (u.getUsername().equalsIgnoreCase(username)) {
                    model.addAttribute("error", "Username already taken.");
                    return "login";
                }
            }
            users.add(new User(nextId++, username, password ));
            model.addAttribute("error", "Account created! Please login.");
            return "login";
        }

        if ("login".equals(action)) {
            for (User u : users) {
                if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
                    userSession.setUserId(u.getId());
                    return "redirect:/"; // now redirect works
                }
            }
            model.addAttribute("error", "Invalid username or password.");
            return "login";
        }

        model.addAttribute("error", "Unknown action.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout() {
        userSession.logout();
        return "redirect:/login?error=Logged out successfully.";
    }
}