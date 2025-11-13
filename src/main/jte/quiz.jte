@param int setId
@param int number
@param int total
@param String question
@param java.util.List<String> options
@param String answer
@param int score
@param String fileTitle
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/quiz.css">
</head>
<body>
<div class="nav-bar">
    <a href="/studysets" class="btn left">View All Notes</a>
    <a href="/" class="btn middle">Upload</a>
    <a href="#" class="btn right">Log Out</a>
</div>

<div class="quiz-container">

<h1>Quiz on: ${fileTitle}</h1>

    <div class="bar">
        <div class="middle">Question ${number} of ${total}</div>
    </div>

    <div class="quiz-box">
    <div id="question-text">${question}</div>



<form method="post">
    @for(var opt : options)
        <label>
            <input type="radio" name="choice" value="${opt}" required> ${opt}
        </label><br>
    @endfor

    <input type="hidden" name="correct" value="${answer}">
    <input type="hidden" name="score" value="${score}">

    @if(number == total)
        <button type="submit">Finish</button>
    @else
        <button type="submit">Next</button>
    @endif

</form>

    </div>
</div>
</body>

</html>