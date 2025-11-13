@import edu.csula.cs3220stu03.studybuddy.models.Quiz
@import java.util.List

@param int studySetId
@param int score
@param int total
@param String fileTitle
@param List<Quiz> allquizzes



<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/quizanswers.css">
</head>
<body>
<div class="nav-bar">
    <a href="/studysets" class="btn left">View All Notes</a>
    <a href="/" class="btn middle">Upload</a>
    <a href="#" class="btn right">Log Out</a>
</div>

<div class="quiz-container">
    <h3>Quiz on: ${fileTitle}</h3>
    <h2>Quiz Complete!</h2>
    <h2>You scored ${score} / ${total}</h2>
</div>
<div class="descriptions">
    @for (var quiz : allquizzes)
    <div class = "description-box">
        <h4>Question ${quiz.getquizID()}</h4>

        <h5>Question text: ${quiz.getQuestion()}</h5>
        <div>Answer :${quiz.getAnswer()}</div>
        <br>
    </div>
    @endfor
</div>>
</body>
</html>