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
    <a href="../All Notes/allnotes.html" class="btn left">View All Notes</a>
    <a href="../Upload Page/index.html" class="btn middle">Home</a>
    <a href="../Login Page/index.html" class="btn right">Log Out</a>
</div>

<div class="quiz-container">
    <h1>Quiz on: Biology</h1>

    <div class="bar">
        <div class="middle">Question 1/10</div>
        <a href="#" class="btn right">Quit</a>
    </div>


    <div  class="quiz-box">
        <div id="question-text">The mitochondria is used to?</div>

        <div class="options">
            <button class="option-btn" onclick="selectOption(0)">control what enters and leaves the cell</button>
            <button class="option-btn" onclick="selectOption(1)">produce energy in the form of ATP</button>
            <button class="option-btn" onclick="selectOption(2)">store genetic information</button>
            <button class="option-btn" onclick="selectOption(3)">synthesize proteins</button>
        </div>
    </div>
</div>

</body>
</html>