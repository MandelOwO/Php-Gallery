<?php

abstract class BaseRepository
{
    protected $dbConn;

    public function __construct()
    {
        $this->dbConn = new Database();
    }

    public function GetAll()
    {
        $sql = 'SELECT * FROM ' . $this->GetTableName() . ' ORDER BY name';

        return $this->dbConn->selectAll($sql);
    }

    public function GetById($id)
    {
        $sql = 'SELECT * FROM ' . $this->GetTableName() . ' WHERE id = :id';

        return $this->dbConn->selectOne($sql, [
            ':id' => $id,
        ]);
    }

    public function Delete($id)
    {
        $sql = 'DELETE FROM ' . $this->GetTableName() . ' WHERE id = :id';

        $this->dbConn->delete($sql, [
            ':id' => $id,
        ]);

    }

    abstract protected function GetTableName();
}