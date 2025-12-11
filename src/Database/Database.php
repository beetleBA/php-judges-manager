<?php

namespace src\Database;

class Database
{
    private \PDO $pdo;
    public function __construct()
    {
        
        $config = require __DIR__ . "/../../config/database.php";
        $dsn = "pgsql:host={$config['host']};port={$config['port']};dbname={$config['dbname']}";
        $this->pdo = new \PDO($dsn, $config["username"], $config["password"]);
        $this->pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    public function getPDO()
    {
        return $this->pdo;
    }
}
