@import edu.csula.cs3220stu03.studybuddy.models.StudySet
@import java.util.List

@param List<StudySet> studySets

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/allnotes.css">
</head>
<body>
<div class="nav-bar">
    <a href="/" class="btn left">Upload</a>
    <a href="#" class="btn right">Log Out</a>
</div>

<div class="notes-container">
<h1>Uploaded Study Sets</h1>

@if(studySets.isEmpty())
    <p>No files have been uploaded yet.</p>
@else
        <div  class="notes-box">
            @for (var sets : studySets)
            <div class="bar">
                <div class="title">${sets.getFilename()}</div>
                <button class="bar-btn" type="button" onclick="exportFile()">Export</button>
                <button class="bar-btn" type="button" onclick="location.href='/flashcards/${sets.getId()}/1'">Flashcards</button>
                <button class="bar-btn" type="button" onclick="location.href='/quiz/${sets.getId()}/1'">Quiz</button>
                <button class="bar-btn danger" type="button" onclick="deleteFile()">Delete</button>
            </div>
           @endfor
        </div>
@endif
</div>
</body>
</html>