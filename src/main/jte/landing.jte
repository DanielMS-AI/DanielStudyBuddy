<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Landing Page</title>
    <link rel="stylesheet" href="/landing.css">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
</head>
<body class="container">
<nav class="navbar navbar-expand-lg mt-3 bg-body-tertiary nav-color">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="bi bi-book"></i>StudyBuddy</a>
        <ul class="navbar-nav ms-auto mb-1 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="/login">Login</a>
            </li>
        </ul>
    </div>
</nav>

    <h1 class="text-center mt-5 mb-5">StudyBuddy</h1>

<form action="/login">
    <button class="start"><div id="bold">Start Learning</div></button>
</form>
<div class="descriptions">
    <div class="description-box">
        <h3>Learn with AI</h3>
        AI helps you study with curated quizzes and flashcards
    </div>
    <div class="description-box">
        <h3>How-To</h3>
        Upload lecture slides and notes to focus on a topic
    </div>
</div>

<div class="howto">
    <div class="howtobox">
        <div id="bold">1.Upload a file from class</div>
        <img src="/images/upload.png" alt="Upload" class="howtoimg" />
    </div>

    <div class="howtobox">
        <div id="bold">2.Practice with flashcards</div>
        <img src="/images/flashcards.png" alt="Flashcards" class="howtoimg" />
    </div>

    <div class="howtobox">
        <div id="bold">3.Take a quiz to test your knowledge</div>
        <img src="/images/quiz.png" alt="Quiz" class="howtoimg" />
    </div>
</div>

</body>
</html>