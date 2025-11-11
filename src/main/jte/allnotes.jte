<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>All Notes</title>
    <link rel="stylesheet" href="/allnotes.css">
</head>
<body>
<div class="nav-bar">
    <a href="../Upload Page/index.html" class="btn left">Home</a>
    <a href="../Login Page/index.html" class="btn right">Log Out</a>
</div>

<div class="notes-container">
    <h1>View all your Uploaded Notes</h1>


    <div  class="notes-box">
        <div class="bar">
            <div class="title">BiologyLecture.pdf</div>
            <button class="bar-btn" type="button" onclick="exportFile()">Export</button>
            <button class="bar-btn" type="button" onclick="location.href='../flashcards/index.html'">Flashcards</button>
            <button class="bar-btn" type="button" onclick="location.href='../Quiz/quiz.html'">Quiz</button>
            <button class="bar-btn danger" type="button" onclick="deleteFile()">Delete</button>
        </div>
        <div class="bar">
            <div class="title">AlgebraStudyGuide.pdf</div>
            <button class="bar-btn" type="button" onclick="exportFile()">Export</button>
            <button class="bar-btn" type="button" onclick="location.href='../flashcards/index.html'">Flashcards</button>
            <button class="bar-btn" type="button" onclick="location.href='../Quiz/quiz.html'">Quiz</button>
            <button class="bar-btn danger" type="button" onclick="deleteFile()">Delete</button>
        </div>
    </div>


</div>

</body>
</html>