<?php
switch ($_SESSION['user_role'] ?? 'guest') {
    case 'guest':
        $menuItems = [

            [
                'url' => '/competitions.php',
                'title' => 'Соревнования'
            ],
            [
                'url' => '/index.php',
                'title' => 'Войти',
                'type' => 'button'
            ]
        ];
        break;
    case 'chief_judge':
        $menuItems = [
            ['url' => '/competitions.php', 'title' => 'Соревнования'],
            ['url' => '/judges.php', 'title' => 'Судьи'],
            ['url' => '/logout.php', 'title' => 'Выход']
        ];
        break;
    case 'admin':
        $menuItems = [
            ['url' => '/competitions.php', 'title' => 'Соревнования (подробно)'],
            ['url' => '/judges.php', 'title' => 'Судьи'],
            ['url' => '/users.php', 'title' => 'Пользователи'],
            ['url' => '/account.php', 'title' => 'Личный кабинет'],
            ['url' => '/logout.php', 'title' => 'Выход']
        ];
        break;

    default:
        $menuItems = [
            ['url' => '/account.php', 'title' => 'Личный кабинет'],
            ['url' => '/logout.php', 'title' => 'Выход']
        ];
}
?>
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
        </nav>
    </div>
</header>