<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');

require_once APP_DIR . 'App.php';
App::init();

$galleryRepo = new GalleryRepository();


$galleries = $galleryRepo->GetAll();

?>

<!doctype html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="styles/style.css">
    <title>Dexlery | Home</title>
</head>
<body id="home">

<?php require_once APP_DIR . 'source/header.php'; ?>

<main>
    <section class="nes-container is-rounded">
        <div class="gallery-grid">

            <?php foreach ($galleries as $gallery) { ?>
                <a href="gallery.php?id_gallery=<?= $gallery['id_gallery'] ?>"
                   class="nes-container with-title is-centered gallery-item">
                    <p class="title"><?= $gallery['name'] ?></p>
                    <img src="img/<?= $gallery['thumbnail'] ?>" alt="gallery thumbnail" class="gallery-thumbnail">
                </a>
            <?php } ?>
        </div>
    </section>

    <section class="new-gallery-dialog">
        <a class="nes-btn is-primary" href="new-gallery.php">Vytvořit novou galerii</a>
    </section>

</main>


</body>
</html>