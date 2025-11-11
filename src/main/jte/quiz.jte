
@import edu.csula.cs3220stu03.studybuddy.models.Quiz
@import java.util.List

@param Integer questionNumber
@param String questionText
@param List<String> options
@param String answer
@param String quizTitle

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quiz</title>
    <link rel="stylesheet" href="/quiz.css">
</head>

<body>
<div class="nav-bar">
    <a href="/allnotes" class="btn left">View All Notes</a>
    <a href="/" class="btn middle">Home</a>
    <a href="/login" class="btn right">Log Out</a>
</div>

<div class="quiz-container">
    <h1>Quiz on: ${quizTitle}</h1>

    <div class="bar">
        <div class="middle">Question ${questionNumber}/10</div>
        <a href="#" class="btn right">Quit</a>
    </div>


    <div  class="quiz-box">
        <div id="question-text">${questionText}</div>

        <form method="post" action="/quiz/answer">
        <div class="options">
            @for (var o : options.size())
                <button class="option-btn" onclick="selectOption(0)">options.get(o)</button>
            @endfor
        </div>
        </form>
    </div>

</body>
</html>