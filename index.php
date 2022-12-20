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
    <title>kocky.cz | domů</title>
</head>
<body id="home">

<header>
    <h1><a href="<?= APP_DIR ?>index.php">Kočky.cz</a></h1>
</header>

<main>
    <div class="nes-container with-title is-rounded">
        <p class="title">Nejnovější galerie</p>
        <p>Good morning. Thou hast had a good night's sleep, I hope.</p>
    </div>
</main>


</body>
</html>
