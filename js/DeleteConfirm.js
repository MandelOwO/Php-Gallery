function deletePhotoDialog(photoId, galleryId, string) {
    if (confirm("Opravdu chcete smazat " + string)) {
        window.location = 'services/DeletePhoto.php?id_gallery=' + galleryId + '&id_photo=' + photoId + '&method=single';
    }
}

function deleteGalleryDialog(galleryId, string) {
    if (confirm("Opravdu chcete smazat " + string)) {
        window.location = 'services/DeletePhoto.php?id_gallery=' + galleryId + '&id_photo=' + photoId + '&method=flush';
    }
}

function eraseGalleryDialog(galleryId, string) {
    if (confirm("Opravdu chcete smazat " + string)) {
        window.location = 'services/DeleteGallery.php?id_gallery=' + galleryId;
    }
}