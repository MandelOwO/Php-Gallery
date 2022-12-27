<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="styles/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


    <title>Add gallery</title>


</head>
<body>

<?php require_once APP_DIR . 'source/header.php'; ?>

<main>
    <form method="post" action="services/NewGallery.php" class="nes-container is-rounded form"
          enctype="multipart/form-data">
        <div class="nes-field">
            <label for="name">Název</label>
            <input type="text" name="name" id="name" class="nes-input">
        </div>

        <div class="nes-field">
            <label for="description">Popis</label>
            <textarea id="description" name="description" class="nes-textarea"></textarea>
        </div>

        <div class="nes-field">
            <label for="thumbnail">Náhledová fotka <small>(nepovinné)</small></label>
            <label for="file-upload" class="nes-btn">
                <i class="fa fa-cloud-upload"></i> Vyberte obrázek
            </label>
            <input id="file-upload" name='upload_cont_img' type="file" style="display:none;" accept="image/*">

            <script src="js/FileUpload.js"></script>
        </div>
        <?php if (isset($_GET['error'])) { ?>
            <span class="nes-text is-error">
            <?php if ($_GET['error'] == 'empty_field') { ?>
                Vypňte všechna pole
            <?php } ?>
        </span>
        <?php } ?>

        <div class="buttons">
            <a href="index.php" class="nes-btn is-error">Zrušit</a>
            <button type="submit" class="nes-btn is-success"> Uložit</button>
        </div>

    </form>
</main>

</body>
</html>
