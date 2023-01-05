$('#file-upload').change(function () {
    var i = $(this).prev('label').clone();
    var file = $('#file-upload')[0].files[0].name;
    $(this).prev('label').text(file);
});

var fileobj;

function upload_file(e, idGallery) {
    e.preventDefault();
    fileobj = e.dataTransfer.files[0];
    ajax_file_upload(fileobj, idGallery);
}

function ajax_file_upload(file_obj, idGallery) {
    if (file_obj != undefined) {
        var form_data = new FormData();
        form_data.append('file', file_obj);
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", './services/AddPhoto.php?id_gallery=' + idGallery, true);
        xhttp.onload = function (event) {
            oOutput = document.querySelector('.img-content');
            if (xhttp.status == 200) {
                // oOutput.innerHTML = "<img src='" + this.responseText + "' alt='The Image' />";
                oOutput.innerHTML = "Soubor byl nahrán, prosím obnovte stránku.";
            } else {
                oOutput.innerHTML = "Error " + xhttp.status + " occurred when trying to upload your file.";
            }
        }

        xhttp.send(form_data);
    }
    window.location = 'gallery.php?id_gallery=' + idGallery + '#dropzone';
}