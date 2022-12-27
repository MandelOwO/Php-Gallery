<?php

class PhotoRepository extends BaseRepository
{
    public function GetTableName(): string
    {
        return 'tb_photos';
    }

    public function Insert($originalName, $uniqueName, $extension, $fileSize, $title, $description, $galleryId)
    {
        $query = '
            INSERT INTO tb_photos SET
                                      original_name = :original_name,
                                      unique_name = :unique_name,
                                      extension = :extension,
                                      file_size = :file_size,
                                      title = :title,
                                      description = :description,
                                      gallery_id = :gallery_id
                
        ';

        $params = [
            ':original_name' => $originalName,
            ':unique_name' => $uniqueName,
            ':extension' => $extension,
            ':file_size' => $fileSize,
            ':title' => $title,
            ':description' => $description,
            ':gallery_id' => $galleryId,
        ];

        $this->dbConn->insert($query, $params);
    }
}