<?php

$idPhoto = $_GET['id_photo'];
$idGallery = $_GET['id_gallery'];

define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');
define('FORM_DIR', '../photo.php?id_gallery=' . $idGallery . '&id_photo=' . $idPhoto . '#photobox');

require_once APP_DIR . 'App.php';
App::init();

$photoRepo = new PhotoRepository();
$galleryRepo = new GalleryRepository();

$photo = $photoRepo->GetPhotoDetail($idPhoto);

$galleryRepo->SetPhotoAsThumb($photo['filename'], $idGallery);

header('Location: ' . FORM_DIR);