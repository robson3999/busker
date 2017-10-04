document.addEventListener("turbolinks:load", function() {
/* Text editor instead of text-area tag */
ClassicEditor
      .create( document.querySelector( '#song_text' ), {
        toolbar: ['bold', 'italic']
      } )
      .catch( error => {
          console.error( error );
      } );
/* Prevent guests from entering songbooks section */
document.getElementById('chordbook').onclick = function(){
  alert("Only available for registered users.");
};
})
