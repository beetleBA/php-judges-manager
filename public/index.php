<?php

session_start();

if (isset($_SESSION["user_id"])) {
    header("Location: /account.php");
    exit;
}
$error = $_GET["error"] ?? null;

?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
    <link rel="icon" type="image/png" sizes="32x32" href="/image/favicon-32x32.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=info" />
    <link rel="stylesheet" href="styles/global.css">
    <link rel="stylesheet" href="styles/login.css">
</head>

<body>
    <?php require __DIR__ . '/../src/Views/layout/header.php' ?>
    <div class="container-login">
        <form action="/login.php" method="POST" class="form-login">
            <div class="">
                <img src="/image/vfla-gorizontalnyij-2.svg" alt="Логотип">
            </div>
            <!-- <h1>Вход</h1> -->
            <p>Добро пожаловать! Введите логин и пароль для входа в систему</p>
            <?php if ($error): ?>
                <div class="callout-error"><span class="material-symbols-outlined">
                        info
                    </span>
                    <?= htmlspecialchars($error) ?></div>
            <?php endif; ?>

            <input type="email" name="login" required placeholder="Логин">
            <input type="password" name="password" required placeholder="Пароль">
            <button type="submit">Войти</button>
        </form>
    </div>

</body>

</html>