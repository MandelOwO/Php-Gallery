<?php
$idGallery = $_GET['id_gallery'];
$method = $_GET['method'];

define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');
define('FORM_DIR', '../gallery.php?id_gallery=' . $idGallery);

require_once APP_DIR . 'App.php';
App::init();

$galleryRepo = new GalleryRepository();
$photoRepo = new PhotoRepository();


if ($method == 'flush') {
    $photos = $photoRepo->GetPhotosByGallery($idGallery);

    header('Location: ' . FORM_DIR);
}
