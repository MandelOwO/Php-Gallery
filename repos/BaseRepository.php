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
    

    abstract protected function GetTableName();
}