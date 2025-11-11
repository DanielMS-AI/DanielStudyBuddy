@import java.util.List

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>upload</title>
    <link rel="stylesheet" href="/upload.css">
</head>
<body>
<div class="button-bar">
    <a href="../All Notes/allnotes.html" class="btn left">View All Notes</a>

    <a href="../Log in Page/index.html" class="btn right">Log Out</a>
</div>

<div class="full-upload-box">

    <h2>Try uploading your notes</h2>

    <form method="post" enctype="multipart/form-data">


        <div>
            <input name="file" type="file" class="upload-box form-control" accept=".txt,.pdf">
        </div>

        <div class="col-2 col-lg-1">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>

    </form>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>