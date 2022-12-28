<?php

class PhotoRepository extends BaseRepository
{
    public function GetTableName(): string
    {
        return 'tb_photos';
    }

    public function Insert($originalName, $uniqueName, $extension, $fileSize, $title, $galleryId)
    {
        $query = '
            INSERT INTO tb_photos SET
                                      original_name = :original_name,
                                      unique_name = :unique_name,
                                      extension = :extension,
                                      file_size = :file_size,
                                      title = :title,
                                      gallery_id = :gallery_id,
                                      created_at = NOW()
                
        ';

        $params = [
            ':original_name' => $originalName,
            ':unique_name' => $uniqueName,
            ':extension' => $extension,
            ':file_size' => $fileSize,
            ':title' => $title,
            ':gallery_id' => $galleryId,
        ];

        return $this->dbConn->insert($query, $params);
    }

    public function GetPhotosByGallery($galleryId)
    {
        $query = "
            SELECT 
                p.*,
                CONCAT(p.unique_name,'.', p.extension) as filename         
            FROM tb_photos as p
                INNER JOIN tb_galleries as g ON p.gallery_id = g.id_gallery
            WHERE id_gallery = :id_gallery
            ORDER BY created_at DESC 
        ";

        $params = [
            'id_gallery' => $galleryId,
        ];

        return $this->dbConn->selectAll($query, $params);
    }
}