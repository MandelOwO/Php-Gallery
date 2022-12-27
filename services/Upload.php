<?php

/**
 * @var string $name
 * @var string $description
 */


$fileName = $_FILES['file']['name'];
$fileExt = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
$fileTmpName = $_FILES['file']['tmp_name'];
$fileSize = $_FILES['file']['size'];
$fileType = $_FILES['file']['type'];
$fileError = $_FILES['file']['error'];

$allowedMimeTypes = [
    'image/jpeg',
    'image/png',
    'image/gif',
];

if ($fileSize == 0 || $fileError != 0) {
//    echo 'File error';
    header('Location: ' . FORM_DIR . '?name=' . $name . '&description=' . $description . '&error=file_error');
    die();
} else if (!in_array($fileType, $allowedMimeTypes)) {
    header('Location: ' . FORM_DIR . '?name=' . $name . '&description=' . $description . '&error=file_type');
    die();
} else if ($fileSize > 10485760) {
    header('Location: ' . FORM_DIR . '?name=' . $name . '&description=' . $description . '&error=file_size');
    die();
}

if ($fileDestination = 'thumbnail') {
    $uniqueName = uniqid(sprintf('thumb_%s_', $name));
} else {
//    $uniqueName = uniqid(sprintf('', $name)); TODO
}

$destination = sprintf('%simg/%s.%s', APP_DIR, $uniqueName, $fileExt);
move_uploaded_file($fileTmpName, $destination);



