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
</head>
<body>
<div class="box">
    <h2>${fileTitle}</h2>
    <h1>Quiz Complete!</h1>
    <div class="score">You scored ${score} / ${total}</div>


    @for (var quiz : allquizzes)
        <h4>Question ${quiz.getquizID()}</h4>

        <h5>Question text: ${quiz.getQuestion()}</h5>
        <div>Answer :${quiz.getAnswer()}</div>
        <br>
    @endfor

</div>
</body>
</html>