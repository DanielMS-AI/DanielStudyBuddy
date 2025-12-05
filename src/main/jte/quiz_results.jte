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
          content="width=device-width, initial-scale=1.0">
    <title>Quiz Results</title>
    <link rel="stylesheet" href="/quizanswers.css">
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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-1 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="/allnotes">View All Notes</a></li>
                <li class="nav-item"><a class="nav-link" href="/">Upload</a></li>
                <li class="nav-item"><a class="nav-link" href="/logout">Log Out</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="quiz-container text-center mt-4">
    <h3>Quiz on: ${fileTitle}</h3>
    <h2>Quiz Complete!</h2>
    <h2>You scored ${score} / ${total}</h2>
</div>

<div class="descriptions row mt-4">
    @for(int i = 0; i < allquizzes.size(); i++)
        <div class="description-box col-md-6 col-lg-4 mb-3">
            <div class="card p-3 h-100">
                <h5>Question ${i + 1}</h5>
                <p><strong>Question text:</strong> ${allquizzes.get(i).getQuestion()}</p>
                <p><strong>Correct Answer:</strong> ${allquizzes.get(i).getAnswer()}</p>
            </div>
        </div>
    @endfor
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>
