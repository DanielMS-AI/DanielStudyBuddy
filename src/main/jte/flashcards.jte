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
</head>
<body>
<h1>Flashcards — ${fileTitle}</h1>
Flashcard <div id="counter"></div> of ${total}



<div id="card-text" style="font-size: 1.5em; margin: 20px 0;"></div>

<button onclick="prevCard()">Previous</button>
<button onclick="flipCard()">Flip</button>
<button onclick="nextCard()">Next</button>



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