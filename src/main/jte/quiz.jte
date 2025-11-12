@param int setId
@param int number
@param int total
@param String question
@param java.util.List<String> options
@param String answer
@param int score

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
<h2>Question ${number} of ${total}</h2>
<p>${question}</p>

<form method="post">
    @for(var opt : options)
        <label>
            <input type="radio" name="choice" value="${opt}" required> ${opt}
        </label><br>
    @endfor
    <input type="hidden" name="correct" value="${answer}">
    <input type="hidden" name="score" value="${score}">

    @if(number == total)
        <button type="submit">Finish</button>
    @else
        <button type="submit">Next</button>
    @endif
</form>
</body>

</html>