// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require jquery_ujs
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require_tree .
// require("jquery").start()
// require("jquery_ujs").start()


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("turbolinks:load", function() {

    var WhisprFiles = {
        previewWhisprFile() {
            if (window.File && window.FileList && window.FileReader) {

                function handleFileSelect(evt) {
                    evt.stopPropagation();
                    evt.preventDefault();

                    let files = evt.target.files || evt.dataTransfer.files;
                    // files is a FileList of File objects. List some properties.
                    for (var i = 0, f; f = files[i]; i++) {

                        // Only process image files.
                        if (!f.type.match('image.*')) {
                            continue;
                        }
                        const reader = new FileReader();

                        // Closure to capture the file information.
                        reader.onload = (function(theFile) {
                            return function(e) {
                                // Render thumbnail.
                                let span = document.createElement('span');
                                span.innerHTML = ['<img class="thumb" src="', e.target.result,
                                    '" title="', escape(theFile.name), '"/>'
                                ].join('');
                                document.getElementById('list').insertBefore(span, null);
                            };
                        })(f);

                        // Read in the image file as a data URL.
                        reader.readAsDataURL(f);
                    }
                }

                function handleDragOver(evt) {
                    evt.stopPropagation();
                    evt.preventDefault();
                    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
                }

                // Setup the dnd listeners.
                // https://stackoverflow.com/questions/47515232/how-to-set-file-input-value-when-dropping-file-on-page
                const dropZone = document.getElementById('drop_zone');
                const target = document.documentElement;
                const fileInput = document.getElementById('whispr_files_url');
                const previewImage = document.getElementById('previewImage');
                const newWhisprForm = document.getElementById('new_whispr');


                if (dropZone) {
                    dropZone.addEventListener('dragover', handleDragOver, false);
                    dropZone.addEventListener('drop', handleFileSelect, false);

                    // Drop zone classes itself
                    dropZone.addEventListener('dragover', (e) => {
                        dropZone.classList.add('is-in-dropper');
                    }, false);

                    dropZone.addEventListener('dragleave', (e) => {
                        dropZone.classList.remove('is-in-dropper');
                    }, false);

                    dropZone.addEventListener('drop', (e) => {
                        e.preventDefault();
                        dropZone.classList.remove('is-in-dropper');
                        fileInput.files = e.dataTransfer.files;
                        // if on whispr/id/edit hide preview image on drop
                        if (previewImage) {
                            previewImage.style.display = 'none';
                        }
                        // If on whispr/new hide dropzone on drop
                        if(newWhisprForm) {
                            dropZone.style.display = 'none';
                        }
                        dropZone.style.display = 'none';
                    }, false);

                    // Body specific
                    target.addEventListener('dragover', (e) => {
                        e.preventDefault();
                        dropZone.classList.add('is-dragging');
                    }, false);

                    // removes is-dragging class to body WHEN NOT dragging
                    target.addEventListener('dragleave', (e) => {
                        dropZone.classList.remove('is-dragging');
                        dropZone.classList.remove('is-in-dropper');
                    }, false);
                }
            }
        },
        whisprHover() {
            $('.whispr_files').hover(function() {
                $(this).children('.whispr-data').toggleClass('visible');
            });
        }

    };
    WhisprFiles.previewWhisprFile();
    WhisprFiles.whisprHover();


});
