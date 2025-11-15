package edu.csula.cs3220stu03.studybuddy.storage;

import edu.csula.cs3220stu03.studybuddy.models.User;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope
public class UserSession {

    private Integer userId;

    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public boolean isLoggedIn() {
        return userId != null;
    }

    public void logout() {
        userId = null;
    }

}
