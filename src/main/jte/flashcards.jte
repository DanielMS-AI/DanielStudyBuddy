@import edu.csula.cs3220stu03.studybuddy.models.Flashcard
@import java.util.List

@param int setId
@param String fileTitle
@param int total
@param List<Flashcard> flashcards

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Flashcards</title>
    <link rel="stylesheet" href="/flashcards.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
</head>

<body class="container">
<nav class="navbar navbar-expand-lg mt-3 bg-body-tertiary nav-color">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="bi bi-book"></i>StudyBuddy</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-1 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="/allnotes">View All Notes</a></li>
                <li class="nav-item"><a class="nav-link" href="/">Upload</a></li>
                <li class="nav-item"><a class="nav-link" href="/logout">Log Out</a></li>
            </ul>
        </div>
    </div>
</nav>

<br>
<h2 class="text-center">Flashcards — ${fileTitle}</h2>

<div class="full-flashcard-box">
    <h4>Flashcard <span id="counter"></span> of ${total}</h4>

    <div class="flashcard-box">
        <div id="card-text" style="font-size: 1em; margin: 20px 0;"></div>
    </div>
</div>

<div class="arrow-container">
    <button class="arrow left mb-1" onclick="prevCard()">&#8592;</button>
    <button class="flip mb-1" onclick="flipCard()">Flip</button>
    <button class="arrow right mb-1" onclick="nextCard()">&#8594;</button>
</div>


<script>
    const flashcards = [
        @for(var f : flashcards)
        {
            id: ${f.getId()},
            question: `${f.getQuestion()}`,
            answer: `${f.getAnswer()}`
        }@if(!f.equals(flashcards.get(flashcards.size()-1))),@endif
        @endfor
    ];

    let currentCard = 0;
    let showingAnswer = false;

    function renderCard() {
        const card = flashcards[currentCard];
        document.getElementById("card-text").textContent = showingAnswer ? card.answer : card.question;
        document.getElementById("counter").textContent = (currentCard + 1);
    }

    function flipCard() {
        showingAnswer = !showingAnswer;
        renderCard();
    }

    function prevCard() {
        currentCard = (currentCard - 1 + flashcards.length) % flashcards.length;
        showingAnswer = false;
        renderCard();
    }

    function nextCard() {
        currentCard = (currentCard + 1) % flashcards.length;
        showingAnswer = false;
        renderCard();
    }

    window.onload = renderCard;
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
