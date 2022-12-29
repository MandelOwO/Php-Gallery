<?php

$idGallery = $_GET['id_gallery'];
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');
require_once APP_DIR . 'App.php';
App::init();

$galleryRepo = new GalleryRepository();
$photoRepo = new PhotoRepository();


$photos = $photoRepo->GetPhotosByGallery($idGallery);
foreach ($photos as $photo) {
    unlink('../img/' . $photo['filename']);
}

$galleryRepo->DeleteGallery($idGallery);

header('Location: ../index.php');