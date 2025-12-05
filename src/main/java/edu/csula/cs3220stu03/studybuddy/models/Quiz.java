package edu.csula.cs3220stu03.studybuddy.models;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "quizzes")
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String question;

    @Column(nullable = false)
    private String answer;

    @ElementCollection
    @CollectionTable(name = "quiz_responses", joinColumns = @JoinColumn(name = "quiz_id"))
    @Column(name = "response")
    private List<String> responses; // now a List<String>

    @ManyToOne
    @JoinColumn(name = "study_set_id", nullable = false)
    private StudySet studySet;

    public Quiz() {}

    public Quiz(String question, String answer, List<String> responses, StudySet studySet) {
        this.question = question;
        this.answer = answer;
        this.responses = responses;
        this.studySet = studySet;
    }

    // Getters & Setters
    public int getId() { return id; }

    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }

    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }

    public List<String> getResponses() { return responses; }
    public void setResponses(List<String> responses) { this.responses = responses; }

    public StudySet getStudySet() { return studySet; }
    public void setStudySet(StudySet studySet) { this.studySet = studySet; }
}
