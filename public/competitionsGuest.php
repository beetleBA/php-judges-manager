<?php
require __DIR__ . "/../src/Database/Database.php";

use src\Database\Database;

$pdo = (new Database())->getPDO();

$search = $_GET['search'] ?? '';
$sort = $_GET['sort'] ?? 'c.id';
$order = $_GET['order'] ?? 'asc';
$regionFilter = $_GET['region'] ?? '';

$sql = "select c.id, c.name, c.start_date, c.end_date, r.name AS region_name,
case
	when c.start_date > NOW() then 'future'
    when c.end_date < NOW() then 'past'
    else 'current'
end as status
from competition c
inner join region r on r.id = c.region_id
where c.start_date <= NOW() and c.end_date >= NOW() 
--where 1=1
";

$params = [];

if (!empty($search)) {
    $sql .= " and (LOWER(c.name) like LOWER(:search) or LOWER(r.name) like LOWER(:search) or c.id::text like :search)";
    $params[':search'] = "%$search%";
}
if (!empty($regionFilter)) {
    $sql .= " and c.region_id = :region";
    $params[":region"] = $regionFilter;
}
$sql .= " order by $sort $order";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$comp = $stmt->fetchAll(PDO::FETCH_ASSOC);

$status = [
    "current" => "Текущее",
    "past" => "Прошедшее",
    "future" => "Будущее",
];

$regionsStmt = $pdo->query("select r.id, r.name from region r order by r.name");
$regions = $regionsStmt->fetchAll(PDO::FETCH_ASSOC);
?>
<?php require __DIR__ . '/../src/Views/layout/header.php'; ?>

<div class="container container-competition">
    <h1>Соревнования</h1>
    <p style="color: gray">Список текущих соревнований</p>
    <form method="GET" class="container-flex">
        <input
            type="search"
            name="search"
            placeholder="Поиск..."
            value="<?= htmlspecialchars($search) ?>"
            oninput="setTimeout(() => this.form.submit(), 1000)">
        <select name="region" id="region"onchange="this.form.submit()">
            <option value="">Все регионы</option>
            <?php foreach ($regions as $region): ?>
                <option value="<?= $region['id'] ?>"
                    <?= $regionFilter == $region['id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($region['name']) ?>
                </option>
            <?php endforeach;   ?>
        </select>

    </form>
    <div class="table">
        <table>
            <thead>
                <tr>
                    <th><a href="?search=<?= urlencode($search) ?>&region=<?= $regionFilter ?>&sort=c.id&order=<?= $order == 'asc' ? 'desc' : 'asc' ?>">№</a></th>
                    <th><a href="?search=<?= urlencode($search) ?>&region=<?= $regionFilter ?>&sort=c.name&order=<?= $order == 'asc' ? 'desc' : 'asc' ?>">Название</a></th>
                    <th><a href="?search=<?= urlencode($search) ?>&region=<?= $regionFilter ?>&sort=c.start_date&order=<?= $order == 'asc' ? 'desc' : 'asc' ?>">Дата начала</a></th>
                    <th><a href="?search=<?= urlencode($search) ?>&region=<?= $regionFilter ?>&sort=c.end_date&order=<?= $order == 'asc' ? 'desc' : 'asc' ?>">Дата окончания</a></th>
                    <th><a href="?search=<?= urlencode($search) ?>&region=<?= $regionFilter ?>&sort=region_name&order=<?= $order == 'asc' ? 'desc' : 'asc' ?>">Место проведения</a></th>
                    <th>Статус</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($comp as $row): ?>
                    <tr>
                        <td><?= $row["id"] ?></td>
                        <td><?= $row["name"] ?></td>
                        <td><?= date('d.m.Y', strtotime($row["start_date"])) ?></td>
                        <td><?= date('d.m.Y', strtotime($row["end_date"])) ?></td>
                        <td><?= $row["region_name"] ?></td>
                        <td>
                            <div class="status <?= 'status-' . $row["status"] ?>">
                                <?= $status[$row["status"]] ?>
                            </div>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

    </div>
</div>

<?php require __DIR__ . '/../src/Views/layout/footer.php'; ?>