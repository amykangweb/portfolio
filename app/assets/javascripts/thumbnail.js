$(document).ready(function(){
  $('.project-thumbnails').hover(function(){
    console.log("hey");
    $(this).children('.thumbnail-overlay').toggleClass('thumbnail-show');
  });
});
