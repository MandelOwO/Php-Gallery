<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');

require_once APP_DIR . 'App.php';
App::init();

$galleryRepo = new GalleryRepository();


var_dump($_POST);
echo '<br>';
var_dump($_FILES);
echo '<br>';

if (empty($_POST)) {
    echo 'Empty post';
//    header('Location: ' . APP_DIR . 'new-gallery.php');
    die();
}

$name = trim($_POST['name']);
$description = trim($_POST['description']);
$thumbnail = 'thumb.png';

if (empty($name) || empty($description)) {
    echo 'Empty value';
    header('Location: ../new-gallery.php?name=' . $name . '&description=' . $description . '&error=empty_field');
    die();
}

$galleryRepo->Insert($name, $description, $thumbnail);