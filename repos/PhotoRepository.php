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
            ORDER BY p.created_at DESC 
        ";

        $params = [
            'id_gallery' => $galleryId,
        ];

        return $this->dbConn->selectAll($query, $params);
    }

    public function GetPhotoDetail($idPhoto)
    {
        $query = "
            SELECT 
            p.*,
                CONCAT(p.unique_name,'.', p.extension) as filename  
            FROM tb_photos as p
            WHERE id_photo = :id_photo 
        ";

        $params = [
            ':id_photo' => $idPhoto
        ];

        return $this->dbConn->selectOne($query, $params);
    }


    public function Delete($photoId)
    {
        $query = "
            DELETE FROM tb_photos
            WHERE id_photo = :id_photo
        ";

        $params = [
            ':id_photo' => $photoId
        ];

        return $this->dbConn->delete($query, $params);
    }

    public function AddLike($photoId)
    {
        $query = "
            INSERT INTO tb_likes SET
                value = 1,
                photo_id = :photo_id
        ";
        $params = [
            ':photo_id' => $photoId
        ];

        return $this->dbConn->insert($query, $params);

    }

    public function GetLikesForPhoto($photoId)
    {
        $query = "
            SELECT 
                COUNT(value) as like_count    
            FROM tb_likes
            WHERE photo_id = :photo_id
        ";
        $params = [
            ':photo_id' => $photoId
        ];

        return $this->dbConn->selectOne($query, $params);
    }

    public function AddRating($photoId, $value)
    {
        $query = "
            INSERT INTO tb_ratings SET
                photo_id = :photo_id,
                value = :value
        ";

        $params = [
            ':photo_id' => $photoId,
            ':value' => $value,
        ];

        $this->dbConn->insert($query, $params);
    }

    public function GetRatingForPhoto($photoId)
    {
        $query = "
            SELECT 
                ROUND(AVG(value),1) as avg_rating
            FROM tb_ratings
            WHERE photo_id = :photo_id
        ";
        $params = [
            ':photo_id' => $photoId
        ];

        return $this->dbConn->selectOne($query, $params);
    }

}