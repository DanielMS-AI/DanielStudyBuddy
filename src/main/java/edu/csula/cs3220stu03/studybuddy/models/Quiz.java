package edu.csula.cs3220stu03.studybuddy.models;

import java.util.List;


public class Quiz {
    public static Integer nextId = 1;
    public Integer quizID;
    public String question;
    public String answer;
    public List<String> responses;

    public Quiz() {this.quizID = nextId++; }


    public Quiz(String question, String answer,  List<String> responses) {
        this.quizID = nextId++;
        this.question = question;
        this.answer = answer;
        this.responses = responses;
    }
    public Integer getquizID() {
        return quizID;
    }
    public void setquizID(Integer quizID) {
        this.quizID = quizID;
    }
    public String getQuestion() {
        return question;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public String getAnswer() {
        return answer;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public List<String> getResponses() {
        return responses;
    }
    public void setResponses(List<String> responses) {
        this.responses = responses;
    }

}

