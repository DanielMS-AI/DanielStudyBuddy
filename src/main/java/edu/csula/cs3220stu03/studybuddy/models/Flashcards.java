package edu.csula.cs3220stu03.studybuddy.models;

public class Flashcards {
    private static Integer nextId = 1;
    private Integer flashcardID;
    private static String question;
    private static String answer;

    public Flashcards(String question, String answer) {
        this.flashcardID = nextId++;
        this.question = question;
        this.answer = answer;
    }
    public Integer getFlashcardID() {
        return flashcardID;
    }
    public void setFlashcardID(Integer flashcardID) {
        this.flashcardID = flashcardID;
    }
    public String getQuestion() {
        return question;
    }
    public String getAnswer() {
        return answer;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
