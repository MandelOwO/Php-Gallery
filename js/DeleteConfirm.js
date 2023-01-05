function deletePhotoDialog(photoId, galleryId, string) {
    if (confirm("Opravdu chcete smazat obrázek?")) {
        window.location = 'services/DeletePhoto.php?id_gallery=' + galleryId + '&id_photo=' + photoId + '&method=single';
    }
}

function deleteGalleryDialog(galleryId, string) {
    if (confirm("Opravdu chcete smazat galerii?")) {
        window.location = 'services/DeleteGallery.php?id_gallery=' + galleryId;
    }
}

function eraseGalleryDialog(galleryId,  string) {
    if (confirm("Opravdu chcete smazat všechnny obrázky v galerii?" )) {
        window.location = 'services/DeletePhoto.php?id_gallery=' + galleryId + '&method=flush';

    }
}