<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>flashcards</title>
    <link rel="stylesheet" href="/flashcards.css">
</head>
<body>

<div class="button-bar">
    <a href="../All Notes/allnotes.html" class="btn left">View All Notes</a>
    <a href="../Upload Page/index.html" class="btn middle">Home</a>
    <a href="../Log in Page/index.html" class="btn right">Log Out</a>
</div>

<div class="full-flashcard-box">
    <h2>Flashcards</h2>

    <div class="flashcard-box">

        <div class="flashcard" onclick="flipCard()">
            <div id="card-text"></div>
        </div>

    </div>
</div>

<div class="arrow-container">
    <button class="arrow left" onclick="prevCard()">&#8592;</button>
    <button class="arrow right" onclick="nextCard()">&#8594;</button>
</div>


<script>
    const flashcards = [
        { question: "Powerhouse of the cell?", answer: "Mitochondria" },
        { question: "How many chromosomes does a human cell have?", answer: "23" },
    ];

    let currentCard = 0;
    let showingAnswer = false;

    function renderCard() {
        const card = flashcards[currentCard];
        document.getElementById("card-text").textContent = showingAnswer ? card.answer : card.question;
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

</body>
</html>