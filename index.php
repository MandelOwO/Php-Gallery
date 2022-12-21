<?php
define('APP_DIR', $_SERVER['DOCUMENT_ROOT'] . '/09_gallery/Php-Gallery/');


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

<header>
    <h1>
        <a href="<?= APP_DIR ?>index.php">
            <i class="nes-pokeball"></i>
            <span class="nes-text pokebal-red">Dexlery</span>
        </a>
    </h1>
</header>

<main>
    <section class="nes-container is-rounded">
        <div class="gallery-grid">

            <div class="nes-container with-title is-centered">
                <p class="title">Container</p>
                <p>Good morning. Thou hast had a good night's sleep, I hope.</p>
            </div>

        </div>
    </section>

    <section class="new-gallery-dialog">
        <a class="nes-btn is-primary" href="new-gallery.php">Vytvořit novou galerii</a>
    </section>

</main>


</body>
</html>
