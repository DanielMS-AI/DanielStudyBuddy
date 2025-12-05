    package edu.csula.cs3220stu03.studybuddy.models;

    import jakarta.persistence.*;

    @Entity
    @Table(name = "flashcards")
    public class Flashcard {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;

        @Column(nullable = false)
        private String question;

        @Column(nullable = false)
        private String answer;

        @ManyToOne
        @JoinColumn(name = "study_set_id", nullable = false)
        private StudySet studySet;

        public Flashcard() {}

        public Flashcard(String question, String answer, StudySet studySet) {
            this.question = question;
            this.answer = answer;
            this.studySet = studySet;
        }

        public int getId() {
            return id;
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

        public StudySet getStudySet() {
            return studySet;
        }
        public void setStudySet(StudySet studySet) {
            this.studySet = studySet;
        }
    }
