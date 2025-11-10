<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quiz Answers</title>
    <link rel="stylesheet" href="/quizanswers.css">
</head>
<body>
<div class="nav-bar">
    <a href="../All Notes/allnotes.html" class="btn left">View All Notes</a>
    <a href="../Upload Page/index.html" class="btn middle">Home</a>
    <a href="../Login Page/index.html" class="btn right">Log Out</a>
</div>

<div class="quiz-container">
    <h3>Quiz on: Biology</h3>
    <h2>Answers</h2>
    <h2>You got: 6/10</h2>
</div>
<div class="buttons-container">
    <button class="arrow left">Try Again</button>
    <button class="arrow right">Keep Going</button>
</div>

<div class="descriptions">
    <!-- temporary this will be replaced with springboot-->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const questions = [
                { number: 1, prompt: "What is the mitochondria?", answer: "Powerhouse of the cell", user: "Correct" },
                { number: 2, prompt: "What does DNA do?", answer: "It carries genetic information", user: "Wrong" },
                { number: 3, prompt: "What is photosynthesis?", answer: "Process by which plants make food",user: "Correct"},
                { number: 4, prompt: "What structure controls what enters and leaves an animal cell?", answer:"The cell membrane controls what enters and leaves the cell.", user: "Correct"},
                { number: 5, prompt: "What is the main function of ribosomes?", answer: "They make proteins for the cell.", user: "Wrong"},
                { number: 6, prompt: "What is the mitochondria?", answer: "Powerhouse of the cell", user: "Correct" },
                { number: 7, prompt: "What does DNA do?", answer: "It carries genetic information", user: "Wrong" },
                { number: 8, prompt: "What is photosynthesis?", answer: "Process by which plants make food",user: "Correct"},
                { number: 9, prompt: "What structure controls what enters and leaves an animal cell?", answer:"The cell membrane controls what enters and leaves the cell.", user: "Correct"},
                { number: 10, prompt: "What is the main function of ribosomes?", answer: "They make proteins for the cell.", user: "Wrong"}
            ];

            const container = document.querySelector(".descriptions");

            questions.forEach(q => {
                const box = document.createElement("div");
                box.classList.add("description-box");
                box.innerHTML = `
      <h4>Question ${q.number}</h4>
      <h5>${q.prompt}</h5>
      <div>${q.answer}</div>
      <br>
      <div>Your answer was: ${q.user}
    `;
                container.appendChild(box);
            });
        });
    </script>
    <!--
                <div class="description-box">
                    <h4>Question 1</h4>
                    AI helps you study with curated quizzes and flashcards
                </div>
                <div class="description-box">
                    <h4>Question 2</h4>
                    Upload lecture slides and notes to focus on a topic
                </div>
                <div class="description-box">
                    <h4>Question 3</h4>
                    AI helps you study with curated quizzes and flashcards
                </div>
                <div class="description-box">
                    <h4 >Question 4</h4>
                    Upload lecture slides and notes to focus on a topic
                </div>
                <div class="description-box">
                    <h4>Question 5</h4>
                    AI helps you study with curated quizzes and flashcards
                </div>
                <div class="description-box">
                    <h4>Question 6</h4>
                    Upload lecture slides and notes to focus on a topic
                </div>
                <div class="description-box">
                     <h4>Question 7</h4>h4>
                AI helps you study with curated quizzes and flashcards
                </div>
                <div class="description-box">
                    <h4>Question 8</h4>
                    AI helps you study with curated quizzes and flashcards
                </div>
                <div class="description-box">
                    <h4>Question 9</h4>
                    AI helps you study with curated quizzes and flashcards
                </div>
                <div class="description-box">
                    <h4>Question 10</h4>
                    AI helps you study with curated quizzes and flashcards
                </div>
        -->

</div>

</body>
</html>