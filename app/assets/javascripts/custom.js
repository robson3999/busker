/* Different font-sizes for song view */
function smallestFont() {
  document.getElementById("song-text-area").style.fontSize = "16px";
};
function mediumFont() {
  document.getElementById("song-text-area").style.fontSize = "20px";
};
function largeFont() {
  document.getElementById("song-text-area").style.fontSize = "xx-large";
};



document.addEventListener("turbolinks:load", function() {

/* Text editor instead of text-area tag */
ClassicEditor
      .create( document.querySelector( '#song_text' ), {
        toolbar: ['bold', 'italic']
      } )
      .catch( error => {
          console.error( error );
      } );
});
