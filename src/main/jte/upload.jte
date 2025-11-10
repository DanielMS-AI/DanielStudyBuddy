<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Upload</title>
    <link rel="stylesheet" href="/upload.css">
</head>
<body>

<div class="button-bar">
    <a href="../All Notes/allnotes.html" class="btn left">View All Notes</a>

    <a href="../Log in Page/index.html" class="btn right">Log Out</a>
</div>


<div class="full-upload-box">

    <h2>Try uploading your notes</h2>

    <form action="/upload" method="post" enctype="multipart/form-data">
        <label for="fileInput" class="upload-box">
            <span><i>📎</i> Add files</span>
            <input type="file" id="fileInput" name="files" multiple />
        </label>

        <div class="options">
            <label>
                Do you want to incorporate ideas outside<br />of what you uploaded?
                <input type="checkbox" checked name="incorporate" />
            </label>
        </div>


    </form>
    <div class="button-row">
        <form action="../Flashcards/index.html">
            <button type="submit" class="btn">Flashcards</button>
        </form>
        <form action="../Quiz/quiz.html">
            <button type="submit" class="btn">Quiz</button>
    </div>
</div>

</body>
</html>