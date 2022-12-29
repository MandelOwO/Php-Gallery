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

        return $this->dbConn->insert($query, $params);
    }

    public function GetById($galleryId)
    {
        $query = '
            SELECT * FROM tb_galleries
            WHERE id_gallery = :id_gallery
        ';

        $params = [
            ':id_gallery' => $galleryId,
        ];

        return $this->dbConn->selectOne($query, $params);
    }

    public function DeleteGallery($galleryId)
    {
        $query = "
            DELETE FROM tb_galleries
            WHERE id_gallery = :id_gallery
        ";

        $params = [
            ':id_gallery' => $galleryId
        ];

        $this->dbConn->delete($query, $params);
    }

}