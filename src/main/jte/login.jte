<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="/login.css">
</head>
<body>

<div class="button-bar">
    <a href="../Landing Page/landing.html" class="btn right">Back</a>
</div>



<main class="main-area d-flex justify-content-center align-items-start">
    <div class="login-box p-5 rounded">
        <h3 class="title text-center mb-4">Sign-up/Login</h3>

        <form id="authForm" onsubmit="return false;">
            <div class="mb-4">
                <input type="email" id="email" class="form-control" placeholder="Email" required>
            </div>

            <div class="mb-4">
                <input type="password" id="password" class="form-control" placeholder="Password" required>
            </div>

            <div class="d-flex justify-content-between align-items-center">
                <button type="button" class="btn btn-custom" onclick="signUp()">Sign Up</button>
                <button type="button" class="btn btn-custom" onclick="logIn()">Log In</button>
            </div>

            <div class="text-center mt-3">
                <a href="#" id="forgotLink" class="forgot-link">Forgot Password</a>
            </div>

            <div id="result" class="alert d-none mt-3 text-center" role="alert"></div>
        </form>
    </div>
</main>


<script src="js/bootstrap.bundle.min.js"></script>

<script>
    function showMessage(type, msg) {
        const el = document.getElementById('result');
        el.className = 'alert mt-3 text-center';
        el.classList.add(type === 'success' ? 'alert-success' : 'alert-danger');
        el.textContent = msg;
        el.classList.remove('d-none');
        setTimeout(() => { el.classList.add('d-none'); }, 4000);
    }

    function isValidEmail(email) {
        return /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(email);
    }

    function signUp() {
        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('password').value;

        if (!email || !password) return showMessage('error', 'Please enter both email and password.');
        if (!isValidEmail(email)) return showMessage('error', 'Please enter a valid email.');

        const users = JSON.parse(localStorage.getItem('sm_users') || '{}');
        if (users[email]) return showMessage('error', 'This email already has an account.');

        users[email] = password;
        localStorage.setItem('sm_users', JSON.stringify(users));
        showMessage('success', `Account created for ${email}`);
        document.getElementById('password').value = '';
    }

    function logIn() {
        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('password').value;

        if (!email || !password) return showMessage('error', 'Please enter both email and password.');

        const users = JSON.parse(localStorage.getItem('sm_users') || '{}');
        if (!users[email]) return showMessage('error', 'No account found for that email.');
        if (users[email] !== password) return showMessage('error', 'Incorrect password.');

        showMessage('success', `Welcome back, ${email}!`);
    }

    document.getElementById('forgotLink').addEventListener('click', function (e) {
        e.preventDefault();
        const email = document.getElementById('email').value.trim();
        if (!email || !isValidEmail(email)) return showMessage('error', 'Enter your email first.');
        const users = JSON.parse(localStorage.getItem('sm_users') || '{}');
        if (!users[email]) return showMessage('error', 'No account found for that email.');
        showMessage('success', 'Password recovery link would be sent (demo).');
    });
</script>
</body>
</html>