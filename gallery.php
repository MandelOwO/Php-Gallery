<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');

require_once APP_DIR . 'App.php';
App::init();

$photoRepo = new PhotoRepository();
$galleryRepo = new GalleryRepository();

$gallery = $galleryRepo->GetById($_GET['id_gallery']);
$photos = $photoRepo->GetPhotosByGallery($_GET['id_gallery']);

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="styles/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <title><?= $gallery['name'] ?></title>
</head>
<body id="gallery">

<?php require_once APP_DIR . 'source/header.php'; ?>

<main>
    <section class="nes-container is-rounded with-title is-centered">
        <p class="title"><?= $gallery['name'] ?></p>
        <p class="nes-container "><?= $gallery['description'] ?></p>
        <div class="gallery-grid">

            <?php foreach ($photos as $photo) { ?>
                <a class="nes-container is-centered gallery-item"
                   href="photo.php?id_gallery=<?= $gallery['id_gallery'] ?>&id_photo=<?= $photo['id_photo'] ?>">
                    <img src="img/<?= $photo['filename'] ?>" alt="">
                </a>
            <?php } ?>

        </div>
    </section>

    <section class="add-photo">
        <form action="services/AddPhoto.php?id_gallery=<?= $gallery['id_gallery'] ?>" method="post"
              class="nes-container is-rounded with-title" enctype="multipart/form-data">
            <p class="title">Přidat obrázek</p>
            <div class="add-photo-grid dropzone" ondrop="upload_file(event, <?= $gallery['id_gallery'] ?>)"
                 ondragover="return false">
                <div class="nes-field photo-title">
                    <label for="title">Popisek</label>
                    <input type="text" name="title" id="title" class="nes-input">
                </div>

                <div class="nes-field">
                    <label for="file-upload" class="nes-btn">
                        <i class="fa fa-cloud-upload"></i> Vyberte obrázek
                    </label>
                    <input id="file-upload" name="file"
                           type="file" style="display:none;" accept="image/" required>
                    <p>Nebo sem přetáhněte</p>
                    <script src="js/FileUpload.js"></script>
                    <div class="img-content nes-text is-success"></div>
                </div>

                <?php if (isset($_GET['error'])): ?>
                    <span class="nes-text is-error">
                    <?php if ($_GET['error'] == 'empty_field') { ?>
                        Vypňte všechna pole
                    <?php } else if ($_GET['error'] == 'file_error') { ?>
                        Soubor se nepodařilo nahrát
                    <?php } else if ($_GET['error'] == 'file_type') { ?>
                        Nepodporovaný formát souboru, použijte prosím: png/jpeg/gif
                    <?php } else if ($_GET['error'] == 'file_size') { ?>
                        Maximální povolená velikost souboru je 10Mb
                    <?php } ?>
                  </span>
                <?php endif; ?>

                <div class="buttons">
                    <button type="submit" class="nes-btn is-success"> Uložit</button>
                </div>
            </div>
        </form>
    </section>

    <section>
        <div class="nes-container is-rounded is-centered gallery-tools">
            <a href="services/DeletePhoto.php?id_gallery=<?= $gallery['id_gallery'] ?>&method=flush">
                <button type="button" class="nes-btn is-warning"
                        onclick="eraseGalleryDialog(<?= $gallery['id_gallery'] ?>, 'všechny obrázky v galerii')">
                    Vyprázdnit galerii
                </button>
            </a>
            <a href="services/DeleteGallery.php?id_gallery=<?= $gallery['id_gallery'] ?>">
                <button type="button" class="nes-btn is-error"
                        onclick="deletePhotoDialog( <?= $gallery['id_gallery'] ?>, 'galerii')">
                    Smazat galerii
                </button>
            </a>
            <script src="js/DeleteConfirm.js"></script>
        </div>
    </section>
</main>

<script>

</script>

</body>
</html>
