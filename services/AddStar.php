<?php
$idPhoto = $_GET['id_photo'];
$idGallery = $_GET['id_gallery'];
$value = $_GET['value'];

define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');
define('FORM_DIR', '../photo.php?id_gallery=' . $idGallery . '&id_photo=' . $idPhoto . '#photobox');

require_once APP_DIR . 'App.php';
App::init();
$photoRepo = new PhotoRepository();

if (!$photoRepo->GetById($idPhoto)){
    header('Location: ' . FORM_DIR);
    die();
}

$photoRepo->AddRating($idPhoto, $value);

header('Location: ' . FORM_DIR);