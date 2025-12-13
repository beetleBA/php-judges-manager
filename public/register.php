<?php
session_start();

use src\Database\Database;

if (isset($_SESSION['user_id'])) {
    header('Location: /competitions.php');
    exit;
}

$error = $_GET['error'] ?? null;
$success = $_GET['success'] ?? null;
?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация</title>
</head>

<body>

    <form method="POST" action="/register.php">
        <?php if ($error): ?>
            <div class="error"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>

        <div class="form-group">
            <input type="email" name="login" required placeholder="Логин">
        </div>

        <div class="form-group">
            <input type="password" name="password" required minlength="6">
        </div>

        <div class="form-group">
            <select id="role_id" name="role_id" required>
                <option value="">Выберите роль</option>
                <?php
                require __DIR__ . '/../src/Database/Database.php';
                $db = new Database();
                $pdo = $db->getPdo();
                $roles = $pdo->query('SELECT id, name FROM role ORDER BY name')->fetchAll();
                foreach ($roles as $role): ?>
                    <option value="<?= $role['id'] ?>"><?= htmlspecialchars($role['name']) ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <button type="submit">Создать</button>
    </form>
</body>

</html>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = trim($_POST['login'] ?? '');
    $password = $_POST['password'] ?? '';
    $role_id = (int)($_POST['role_id'] ?? 0);

    if (empty($login) || empty($password) || $role_id === 0) {
        header('Location: /register.php?error=' . urlencode('Заполните все поля'));
        exit;
    }

    if (strlen($password) < 6) {
        header('Location: /register.php?error=' . urlencode('Пароль минимум 6 символов'));
        exit;
    }

    $db = new Database();
    $pdo = $db->getPdo();

    $check = $pdo->prepare('SELECT id FROM "user" WHERE login = ?');
    $check->execute([$login]);
    if ($check->fetch()) {
        header('Location: /register.php?error=' . urlencode('Логин уже занят'));
        exit;
    }

    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $stmt = $pdo->prepare('INSERT INTO "user" (login, password, role_id) VALUES (?, ?, ?)');
    $result = $stmt->execute([$login, $hashed_password, $role_id]);

    if ($result) {
        header('Location: /register.php?success=' . urlencode('Пользователь создан!'));
        exit;
    } else {
        header('Location: /register.php?error=' . urlencode('Ошибка создания'));
        exit;
    }
}
?>