package edu.csula.cs3220stu03.studybuddy;

import edu.csula.cs3220stu03.studybuddy.models.User;
import edu.csula.cs3220stu03.studybuddy.repositories.UserRepository;
import edu.csula.cs3220stu03.studybuddy.storage.UserSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    private final UserSession userSession;
    private final UserRepository userRepository;

    public LoginController(UserSession userSession, UserRepository userRepository) {
        this.userSession = userSession;
        this.userRepository = userRepository;
    }

    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false) String error, Model model) {
        model.addAttribute("error", error);
        return "login";
    }

    @PostMapping("/login")
    public String loginPost(@RequestParam String username,
                            @RequestParam String password,
                            @RequestParam String action,
                            Model model) {

        if ("signup".equals(action)) {
            if (userRepository.findByUsername(username).isPresent()) {
                model.addAttribute("error", "Username already taken.");
                return "login";
            }

            User newUser = new User(username, password);
            userRepository.save(newUser);

            model.addAttribute("error", "Account created! Please login.");
            return "login";
        }

        if ("login".equals(action)) {
            var optionalUser = userRepository.findByUsername(username);

            if (optionalUser.isEmpty()) {
                model.addAttribute("error", "Invalid username or password.");
                return "login";
            }

            User user = optionalUser.get();

            if (!user.getPassword().equals(password)) {
                model.addAttribute("error", "Invalid username or password.");
                return "login";
            }

            userSession.setUserId(user.getId());

            return "redirect:/";
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
