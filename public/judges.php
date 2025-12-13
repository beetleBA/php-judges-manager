<?php
session_start();

$role = $_SESSION["user_role"];
require __DIR__ . "/../src/Database/Database.php";

use src\Database\Database;

$pdo = (new Database())->getPDO();

$search = $_GET["search"] ?? "";
$regionFilter = $_GET["region"] ?? "";
$catFilter = $_GET["cat"] ?? "";
$order = $_GET["order"] ?? "asc";
$sort = $_GET["sort"] ?? "j2.id";


$sql = '
select j2.id, j2.surname, j2."name", j2.patronymic, j."name" as cat_name, j2.email, r.name as reg_name 
from orderforcategory o 
inner join judge_category j on o.category_id = j.id
right join judge j2 on o.judge_id = j2.id
inner join region r on r.id = j2.region_id
';

$params = [];

if (!empty($search)) {
    $sql .= ' and (LOWER(j2.name) like LOWER(:search)
    or LOWER(j2.surname) like LOWER(:search)
    or LOWER(j2.patronymic) like LOWER(:search)
    or LOWER(j."name") like LOWER(:search)
    or LOWER(j2.email) like LOWER(:search)
    or LOWER(r.name) like LOWER(:search)
    
    )
    ';
    $params[':search'] = "%$search%";
}
if (!empty($regionFilter)) {
    $sql .= " and j2.region_id = :region";
    $params[":region"] = $regionFilter;
}
if (!empty($catFilter)) {
    $sql .= " and o.category_id = :cat";
    $params[":cat"] = $catFilter;
}
$sql .= " order by $sort $order ";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$judges = $stmt->fetchAll(PDO::FETCH_ASSOC);


$regionsStmt = $pdo->query("select r.id, r.name from region r order by r.name");
$regions = $regionsStmt->fetchAll(PDO::FETCH_ASSOC);

$catStmt = $pdo->query("select j.id, j.name from judge_category j order by j.name");
$cat = $catStmt->fetchAll(PDO::FETCH_ASSOC);

function getSortLink($val)
{
    global $search, $catFilter, $regionFilter, $order;
    $newOrder = ($order == 'asc') ? 'desc' : 'asc';
    return "?search=" . urlencode($search) . "&region=$regionFilter&cat=$catFilter&sort=$val&order=$newOrder";
}
function getSortArrow($val)
{
    global $sort, $order;
    if ($sort == $val) {
        return $order == 'asc' ? ' &#x2191;' : ' &#x2193;';
    }
    return '';
}


?>



<?php require __DIR__ . '/../src/Views/layout/header.php' ?>


<div class="container container-competition">
    <h3>Судьи</h3>

    <form method="GET" class="container-flex">
        <input
            type="search"
            name="search"
            placeholder="Поиск..."
            value="<?= htmlspecialchars($search) ?>"
            oninput="setTimeout(() => this.form.submit(), 2000)">
        <select name="region" id="region" onchange="this.form.submit()">
            <option value="">Все регионы</option>
            <?php foreach ($regions as $region): ?>
                <option value="<?= $region['id'] ?>"
                    <?= $regionFilter == $region['id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($region['name']) ?>
                </option>
            <?php endforeach;   ?>
        </select>
        <select name="cat" id="cat" onchange="this.form.submit()">
            <option value="">Все категории</option>
            <?php foreach ($cat as $item): ?>
                <option value="<?= $item['id'] ?>"
                    <?= $catFilter == $item['id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($item['name']) ?>
                </option>
            <?php endforeach;   ?>
        </select>
        <?php if ($role == 'Главный судья' || $role == 'Администратор'): ?>
            <a href="edit.php"><button type="button">Добавить</button></a>
        <?php endif; ?>

    </form>
    <div class="table">
        <table>
            <thead>
                <tr>
                    <th><a href="<?= getSortLink('j2.id') ?>">№<span><?= getSortArrow('j2.id') ?></span></a></th>
                    <th><a href="<?= getSortLink('j2.surname') ?>">Фамилия<?= getSortArrow('j2.surname') ?></a></th>
                    <th><a href="<?= getSortLink('j2.name') ?>">Имя<?= getSortArrow('j2.name') ?></a></th>
                    <th><a href="<?= getSortLink('j2.patronymic') ?>">Отчество<?= getSortArrow('j2.patronymic') ?></a></th>
                    <th><a href="<?= getSortLink('j.name') ?>">Категория<?= getSortArrow('j.name') ?></a></th>
                    <th><a href="<?= getSortLink('j2.email') ?>">Почта<?= getSortArrow('j2.email') ?></a></th>
                    <th><a href="<?= getSortLink('r.name') ?>">Регион<?= getSortArrow('r.name') ?></a></th>
                    <?php if ($role == 'Главный судья' || $role == 'Администратор'): ?>
                        <th>Действия</th>
                    <?php endif; ?>
                    <?php if ($role == 'Администратор'): ?>
                        <th></th>
                    <?php endif; ?>

                </tr>
            </thead>

            <tbody>
                <?php foreach ($judges as $row): ?>
                    <tr>
                        <td><?= $row["id"] ?></td>
                        <td><?= $row["surname"] ?></td>
                        <td><?= $row["name"] ?></td>
                        <td><?= $row["patronymic"] ?></td>
                        <td><?= $row["cat_name"] ?></td>
                        <td><?= $row["email"] ?></td>

                        <td><?= $row["reg_name"] ?></td>
                        <?php if ($role == 'Главный судья' || $role == 'Администратор'): ?>
                            <td><a href="edit.php?id=<?= $row['id'] ?>">Редактировать</a></td>
                        <?php endif; ?>
                        <?php if ($role == 'Администратор'): ?>
                            <td><a href="">Удалить</a></td>
                        <?php endif; ?>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

    </div>
</div>

<?php require __DIR__ . '/../src/Views/layout/footer.php' ?>