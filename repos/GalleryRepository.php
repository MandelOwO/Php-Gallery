<?php

class GalleryRepository extends BaseRepository
{
    public function GetTableName(): string
    {
        return 'tb_galleries';
    }

    public function Insert($name, $description, $thumbnail)
    {
        $query = '
            INSERT INTO tb_galleries SET
            name = :name,
            description = :description,
            created_at = NOW(),
            thumbnail = :thumbnail
        ';

        $params = [
            ':name' => $name,
            ':description' => $description,
            ':thumbnail' => $thumbnail,
        ];

        $this->dbConn->insert($query, $params);
    }

}