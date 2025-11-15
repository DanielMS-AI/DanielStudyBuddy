@import java.lang.String
@param String error

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <link rel="stylesheet" href="/login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="button-bar">
    <a href="/landing" class="btn right">Back</a>
</div>

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
                <button type="submit" name="action" value="signup" class="btn btn-primary">Sign Up</button>
                <button type="submit" name="action" value="login" class="btn btn-secondary">Log In</button>
            </div>
        </form>
    </div>
</main>

</body>
</html>