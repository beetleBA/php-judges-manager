<?php
session_start();

if (!isset($_SESSION["user_id"])) {
    header("Location: /index.php");
    exit;
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Аккаунт</title>
    <link rel="stylesheet" href="styles/global.css">

</head>

<body>
    <?php require __DIR__ . '/../src/Views/layout/header.php' ?>
    <h1>Кабинет</h1>
</body>

</html>