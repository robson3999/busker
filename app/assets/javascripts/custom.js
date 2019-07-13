/* Print button */
function printBook() {
    window.print();
}

/* Different font-sizes for song view */
function smallestFont() {
  document.getElementById("song-text-area").style.fontSize = "13px";
};
function mediumFont() {
  document.getElementById("song-text-area").style.fontSize = "16px";
};
function largeFont() {
  document.getElementById("song-text-area").style.fontSize = "20px";
};



document.addEventListener("turbolinks:load", function() {
  ClassicEditor.editorConfig = function( config ) {
    config.language = 'en';
    config.height = '250px';
  };

  ClassicEditor.create(document.querySelector('#song_body'), {
    toolbar: ['bold', 'italic']
  })
  .catch( error => {} )
});
