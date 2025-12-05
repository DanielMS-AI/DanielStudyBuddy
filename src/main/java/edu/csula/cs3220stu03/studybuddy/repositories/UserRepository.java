package edu.csula.cs3220stu03.studybuddy.repositories;

import edu.csula.cs3220stu03.studybuddy.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByUsername(String username);
}
