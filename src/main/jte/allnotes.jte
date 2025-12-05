@import edu.csula.cs3220stu03.studybuddy.models.StudySet
@import java.util.List

@param List<StudySet> studySets

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploaded Study Sets</title>
    <link rel="stylesheet" href="/allnotes.css">
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
                    <a class="nav-link" href="/">Upload</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="notes-container">
    <h1>Uploaded Study Sets</h1>

    @if(studySets.isEmpty())
        <p>No files have been uploaded yet.</p>
    @else
        <div class="notes-box container-center">
            @for (var set : studySets)
                <nav class="navbar navbar-expand-lg mt-3 bg-body-tertiary nav-color">
                    <div class="bar d-flex align-items-center justify-content-between py-1 px-2 border rounded mb-2">
                        <span class="title fw-bold fs-5 text-truncate me-3 flex-grow-1">${set.getTitle()}</span>

                        <button class="navbar-toggler p-1 me-1" type="button" data-bs-toggle="collapse"
                                data-bs-target="#set-menu-${set.getId()}" aria-controls="set-menu-${set.getId()}"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="set-menu-${set.getId()}">
                            <ul class="navbar-nav ms-auto mb-0 d-flex flex-row">
                                <li class="nav-item me-2">
                                    <button class="nav-link p-1" type="button" onclick="location.href='/flashcards/${set.getId()}'">
                                        <i class="bi bi-card-text"></i> Flashcards
                                    </button>
                                </li>
                                <li class="nav-item me-2">
                                    <button class="nav-link p-1" type="button" onclick="location.href='/quiz/${set.getId()}/1'">
                                        <i class="bi bi-check2-square"></i> Quiz
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link p-1 text-danger" type="button"
                                            onclick="if(confirm('Are you sure you want to delete this study set?')) location.href='/delete/${set.getId()}'">
                                        <i class="bi bi-trash"></i> Delete
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            @endfor
        </div>
    @endif
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>