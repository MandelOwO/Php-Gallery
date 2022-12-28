<?php
$galleryId = $_GET['id_gallery'];
$fileDestination = 'photo';

define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');
define('FORM_DIR', '../gallery.php?id_gallery=' . $galleryId);

require_once APP_DIR . 'App.php';
App::init();
$photoRepo = new PhotoRepository();

$name = trim($_POST['title']);
$description = 'photo';


/**
 * @var string $fileName
 * @var string $uniqueName
 * @var string $fileExt
 * @var int $fileSize
 */
require_once 'Upload.php';

$photoRepo->Insert($fileName, $uniqueName, $fileExt, $fileSize, $name, $galleryId);

header('Location: ' . FORM_DIR);