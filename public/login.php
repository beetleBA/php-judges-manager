<?php

session_start();

require __DIR__ . "/../src/Database/Database.php";

use src\Database\Database;

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: /");
    exit;
}

$login = trim($_POST['login'] ?? '');
$password = $_POST['password'] ?? '';

if ($login === '' || $password === '') {
    header('Location: /index.php?error=' . urldecode('Заполните все поля'));
    exit;
}

$pdo = (new Database())->getPdo();

$sql = '
    select u.id, u.login, u.password, r.name as role_name
    from "user" u
    inner join role r on u.role_id = r.id
    where u.login = :login
    limit 1 
';

$stmt = $pdo->prepare($sql);
$stmt->execute(['login' => $login]);
$user = $stmt->fetch(\PDO::FETCH_ASSOC);

if (!$user || !password_verify($password, $user['password'])) {
    header('Location: /index.php?error=' . urlencode('Неверный логин или пароль'));
    exit;
}

$_SESSION['user_id'] = $user['id'];
$_SESSION['user_login'] = $user['login'];
$_SESSION['user_role'] = $user['role_name'];

header('Location: /competitions.php');
exit;
