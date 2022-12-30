<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');

require_once APP_DIR . 'App.php';
App::init();

$photoRepo = new PhotoRepository();

$idPhoto = $_GET['id_photo'];
$idGallery = $_GET['id_gallery'];

$photo = $photoRepo->GetPhotoDetail($idPhoto);
$otherPhotos = $photoRepo->GetPhotosByGallery($idGallery);

$photoInArray = array_search($photo, $otherPhotos);

$nextPhoto = $otherPhotos[$photoInArray + 1] ?? null;
$previousPhoto = $otherPhotos[$photoInArray - 1] ?? null;

$likeCount = $photoRepo->GetLikesForPhoto($photo['id_photo'])['like_count']


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="styles/style.css">

    <title>Dexlery</title>
</head>
<body id="photo">

<?php require_once APP_DIR . 'source/header.php'; ?>

<main>
    <section class="nes-container is-rounded with-title is-centered photo-detail" id="photobox">
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
            <a class="left"
                <?php if ($previousPhoto == null) { ?>
                    href="gallery.php?id_gallery=<?= $idGallery ?>"
                <?php } else { ?>
                    href="photo.php?id_gallery=<?= $idGallery ?>&id_photo=<?= $previousPhoto['id_photo'] ?>"
                <?php } ?>
            >
                <img src="icons/arrow-left.png" alt=""
                     class="arrow">
            </a>
            <a class="right"
                <?php if ($nextPhoto == null) { ?>
                    href="gallery.php?id_gallery=<?= $idGallery ?>"
                <?php } else { ?>
                    href="photo.php?id_gallery=<?= $idGallery ?>&id_photo=<?= $nextPhoto['id_photo'] ?>"
                <?php } ?>
            >
                <img src="icons/arrow-right.png" alt=""
                     class="arrow">
            </a>
        </div>
    </section>

    <section>
        <div class="nes-container is-rounded social-controls">
            <a href="services/AddLike.php?id_gallery=<?= $idGallery ?>&id_photo=<?= $photo['id_photo'] ?>"
               class="nes-badge is-splited">
                <span class="is-dark"><i class="nes-icon is-small like"></i></span>
                <span class="is-primary"><?= $likeCount ?></span>
            </a>
            <div class="stars">
                <i class="nes-icon is-medium star is-empty"></i>
                <i class="nes-icon is-medium star is-empty"></i>
                <i class="nes-icon is-medium star is-empty"></i>
                <i class="nes-icon is-medium star is-empty"></i>
                <i class="nes-icon is-medium star is-empty"></i>
            </div>
        </div>
    </section>

    <section>
        <div class="nes-container is-rounded with-title is-centered gallery-tools">
            <a href="">
                <button type="button" class="nes-btn is-error">Smazat obrázek</button>
            </a>
            <a href="services/SetThumbnail.php?id_gallery=<?= $idGallery ?>&id_photo=<?= $photo['id_photo'] ?>">
                <button type="button" class="nes-btn is-primary">Použít jako titulní fotku</button>
            </a>

        </div>
    </section>
</main>

</body>
</html>
