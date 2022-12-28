<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');

require_once APP_DIR . 'App.php';
App::init();

$photoRepo = new PhotoRepository();

$idPhoto = $_GET['id_photo'];
$idGallery = $_GET['id_gallery'];

$photo = $photoRepo->GetPhotoDetail($idPhoto);

//var_dump($photo);

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="styles/style.css">

    <title>Document</title>
</head>
<body id="photo">

<?php require_once APP_DIR . 'source/header.php'; ?>

<main>
    <section class="nes-container is-rounded with-title is-centered photo-detail">
        <p class="title">
            <
            <?= $photo['title'] ?>
            >
        </p>
        <div class="content">
            <div class="photo">
                <img src="img/<?= $photo['filename'] ?>" alt="">
            </div>
            <a class="close" href="gallery.php?id_gallery=<?= $idGallery ?>">
                <i class="nes-icon close is-medium close"></i>
            </a>
            <a class="left" href="photo.php?id_gallery=<?= $idGallery ?>&id_photo=">
                <img src="icons/arrow-left.png" alt=""
                     class="arrow">
            </a>
            <a class="right" href="photo.php?id_gallery=<?= $idGallery ?>&id_photo=">
                <img src="icons/arrow-right.png" alt=""
                     class="arrow">
            </a>


        </div>
    </section>
</main>

</body>
</html>
