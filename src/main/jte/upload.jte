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
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
</head>
<body class="container">
<nav class="navbar navbar-expand-lg mt-3 bg-body-tertiary nav-color">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="bi bi-book"></i>StudyBuddy</a>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-1 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/allnotes">View All Notes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>




<div class="full-upload-box">
    <h2>Try uploading your notes</h2>
    <form method="post" enctype="multipart/form-data">

        <div class="upload-box" id="upload-box">
            <span id="upload-text"><i class="bi bi-upload"></i> Click to add a file here</span>
            <input id="file-input" name="file" type="file" accept=".txt,.pdf">
        </div>
        <div class="text-center fw-lighter"> Disclaimer: pdf or txt only</div>
        <br>
        <div class="text-center">
            <button id="submit-btn" type="submit" class="btn btn-success btn-lg" style="padding: 1rem 2rem; font-size: 1.25rem;">
                <span class="spinner-border spinner-grow-sm spinner-text-success d-none" id="loading-spinner" role="status" aria-hidden="true"></span>
                <span id="submit-text">Submit</span>
            </button>
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
<script>
    document.querySelector("form").addEventListener("submit", function () {
        const btn = document.getElementById("submit-btn");
        const spinner = document.getElementById("loading-spinner");
        const text = document.getElementById("submit-text");

        // Disable button so user can't click twice
        btn.disabled = true;

        // Show spinner
        spinner.classList.remove("d-none");

        // Hide text
        text.textContent = "Loading...";
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>