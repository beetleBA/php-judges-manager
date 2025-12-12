<?php

session_start();

if (isset($_SESSION["user_id"])) {
    header("Location: /account.php");
    exit;
}
$error = $_GET["error"] ?? null;

?>

<?php require __DIR__ . '/../src/Views/layout/header.php'; ?>

<div class="container-login">
    <form action="/login.php" method="POST" class="form-login">
        <div class="">
            <img src="/image/vfla-gorizontalnyij-2.svg" alt="Логотип">
        </div>
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
<?php require __DIR__ . '/../src/Views/layout/footer.php'; ?>
