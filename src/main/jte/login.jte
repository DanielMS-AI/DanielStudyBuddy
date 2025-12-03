@import java.lang.String
@param String error

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <link rel="stylesheet" href="/login.css">
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
            <ul class="navbar-nav ms-auto mb-1 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/landing">Back</a>
                </li>
            </ul>
    </div>
</nav>

<main class="main-area d-flex justify-content-center align-items-start">
    <div class="login-box p-4 rounded shadow">

        @if(error != null)
        <div class="alert alert-danger text-center mt-3">
            ${error}
        </div>
        @endif

        <h3 class="text-center">Sign-up / Login</h3>

        <form action="/login" method="POST">
            <div class="mb-4">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-control" required />
            </div>

            <div class="mb-4">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required />
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" name="action" value="signup" class="btn btn-success">Sign Up</button>
                <button type="submit" name="action" value="login" class="btn btn-secondary">Log In</button>
            </div>
        </form>
    </div>
</main>

</body>
</html>