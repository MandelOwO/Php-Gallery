<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');
define('FORM_DIR', '../new-gallery.php');
$fileDestination = 'thumbnail';

require_once APP_DIR . 'App.php';
App::init();

$galleryRepo = new GalleryRepository();
$photoRepo = new PhotoRepository();


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
    header('Location: ' . FORM_DIR . '?name=' . $name . '&description=' . $description . '&error=empty_field');
    die();
}

/**
 * @var string $fileName
 * @var string $uniqueName
 * @var string $fileExt
 * @var int $fileSize
 */
if (!empty($_FILES['file']['name'])) {
    require_once 'Upload.php';
    $thumbnail = sprintf('%s.%s', $uniqueName, $fileExt);
}


$galleryId = $galleryRepo->Insert($name, $description, $thumbnail);

$photoRepo->Insert($fileName, $uniqueName, $fileExt, $fileSize, null, null, $galleryId);

header('Location: ../index.php');
