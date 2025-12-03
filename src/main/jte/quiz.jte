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
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-1 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/allnotes">View All Notes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/">Upload</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br>
<h2 class="text-center">Quiz on: ${fileTitle}</h2>

<div class="quiz-container">
        <h4 class="text-center">Question ${number} of ${total}</h4>

    <div class="quiz-box">
    <h3 class="mt-4 mb-3">${question}</h3>

<form method="post">
    @for(var opt : options)
        <input type="radio"
               class="btn-check"
               name="choice"
               id="choice-${opt}"
               value="${opt}"
               required>

        <label class="btn btn-light mt-1 mb-1" for="choice-${opt}">
            ${opt}
        </label><br>
    @endfor
    <input type="hidden" name="correct" value="${answer}">
    <input type="hidden" name="score" value="${score}">

    @if(number == total)
        <button class="btn btn-success mt-3 mb-3" type="submit">Finish</button>
    @else
        <button class="btn btn-success mt-3 mb-3" type="submit">Next</button>
    @endif

</form>

    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>

</html>