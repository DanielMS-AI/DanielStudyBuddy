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
    <a href="/allnotes" class="btn left">View All Notes</a>

    <a href="/logout" class="btn right">Log Out</a>
</div>

<div class="full-upload-box">

    <h2>Try uploading your notes</h2>

    <form method="post" enctype="multipart/form-data">


        <div class="upload-box" id="upload-box">
            <span id="upload-text">Click to add a file here</span>
            <input id="file-input" name="file" type="file" accept=".txt,.pdf">
        </div>
        <div class="col-2 col-lg-1">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>

    </form>

</div>
<script>
    const fileInput = document.getElementById('file-input');
    const uploadText = document.getElementById('upload-text');

    fileInput.addEventListener('change', function () {
        if (fileInput.files.length > 0) {
            uploadText.textContent = fileInput.files[0].name;
        } else {
            uploadText.textContent = 'Click to add a file here';
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>