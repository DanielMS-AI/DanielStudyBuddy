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
    <title>Document</title>
    <link rel="stylesheet" href="/flashcards.css">
</head>
<body>
<div class="button-bar">
    <a href="/allnotes" class="btn left">View All Notes</a>
    <a href="/" class="btn middle">Upload</a>
    <a href="#" class="btn right">Log Out</a>
</div>

<div class="full-flashcard-box">
<h2>Flashcards — ${fileTitle}</h2>
    <div class="flashcard-box">
Flashcard <div id="counter"></div> of ${total}
<div id="card-text" style="font-size: 1em; margin: 20px 0;"></div>
</div>
</div>

<div class="arrow-container">
<button class="arrow left" onclick="prevCard()">&#8592;</button>
<button onclick="flipCard()">Flip</button>
<button class="arrow right" onclick="nextCard()">&#8594;</button>
</div>


<script>
    const flashcards = [
        @for(var f : flashcards)
        {number: "${f.getFlashcardID()}", question: "${f.getQuestion()}", answer: "${f.getAnswer()}" }@if(!f.equals(flashcards.get(flashcards.size()-1))),@endif
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
</body>
</html>