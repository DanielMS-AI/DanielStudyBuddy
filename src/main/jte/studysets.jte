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
</head>
<body>
<h1>Uploaded Study Sets</h1>

@if(studySets.isEmpty())
    <p>No files have been uploaded yet.</p>
@else
    <table border="1" cellpadding="8">
        <tr>
            <th>ID</th>
            <th>File Name</th>
            <th>Flashcards</th>
            <th>Quizzes</th>
            <th>view</th>
        </tr>

        @for(var set : studySets)
            <tr>
                <td>${set.getId()}</td>
                <td>${set.getFilename()}</td>
                <td><a href="/flashcards/${set.getId()}/1">Start flashcards</a>
                    @for(var card : set.getFlashcards())
                        <li><strong>Q:</strong> ${card.getQuestion()} <br> <strong>A:</strong> ${card.getAnswer()}</li>
                    @endfor
                </td>
                <td>${set.getQuizzes().size()}</td>
                <td><a href="/quiz/${set.getId()}/1">Start Quiz</a></td>
            </tr>
        @endfor
    </table>
@endif

</body>
</html>