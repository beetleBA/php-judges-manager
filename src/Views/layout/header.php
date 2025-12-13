<?php
switch ($_SESSION['user_role'] ?? 'guest') {
    case 'guest':
        $menuItems = [

            [
                'url' => '/competitions.php',
                'title' => 'Соревнования',
                'type' => 'text'
            ],
            [
                'url' => '/index.php',
                'title' => 'Войти',
                'type' => 'button'
            ]
        ];
        break;
    case 'Главный судья':
        $menuItems = [
            [
                'url' => '/competitions.php',
                'title' => 'Соревнования',
                'type' => 'text'
            ],
            [
                'url' => '/judges.php',
                'title' => 'Судьи',
                'type' => 'text'
            ],
            [
                'url' => '/logout.php',
                'title' => 'Выход',
                'type' => 'text'
            ]
        ];
        break;
    case 'Администратор':
        $menuItems = [
            [
                'url' => '/competitions.php',
                'title' => 'Соревнования',
                'type' => 'text'
            ],
            [
                'url' => '/judges.php',
                'title' => 'Судьи',
                'type' => 'text'
            ],
            [
                'url' => '/users.php',
                'title' => 'Пользователи',
                'type' => 'text'
            ],
            [
                'url' => '/logout.php',
                'title' => 'Выход',
                'type' => 'text'
            ]
        ];
        break;

    default:
        $menuItems = [
            [
                'url' => '/competitions.php',
                'title' => 'Соревнования',
                'type' => 'text'
            ],
            [
                'url' => '/judges.php',
                'title' => 'Судьи',
                'type' => 'text'
            ],
            [
                'url' => '/logout.php',
                'title' => 'Выход',
                'type' => 'text'
            ]
        ];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="32x32" href="/image/favicon-32x32.png">

    <title>ЛА</title>
    <link rel="stylesheet" href="styles/global.css">
</head>
<header>
    <div class="container container-header">
        <a href="/" class="logo">
            <img src="/image/vfla-gorizontalnyij-2.svg" alt="">
        </a>
        <nav>
            <?php foreach ($menuItems as $menuItem): ?>
                <?php if ($menuItem['type'] === 'button'): ?>
                    <a href="<?= htmlspecialchars($menuItem['url']) ?>"
                        class="btn btn-primary">
                        <button><?= htmlspecialchars($menuItem['title']) ?></button>

                    </a>
                <?php else: ?>
                    <a href="<?= htmlspecialchars($menuItem['url']) ?>">
                        <?= htmlspecialchars($menuItem['title']) ?>
                    </a>
                <?php endif; ?>
            <?php endforeach; ?>
            <?php if (isset($_SESSION['user_role'])):  ?>
                <div class="">
                    <p><?= $_SESSION['user_login'] ?></p>
                    <p style="font-size: 12px;color:gray"><?= $_SESSION['user_role'] ?></p>
                </div>
            <?php endif ?>
        </nav>
    </div>
</header>
<main>