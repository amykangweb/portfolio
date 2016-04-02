$(document).ready(function(){
  $("#menu-toggle").click(function(e) {
      console.log("hi");
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
      $('.fa-bars').toggleClass("sidebar-out");
  });
  $('.scroll-div').click(function(){
    var divID = '#' + $(this).data('goal');
    $('html, body').animate({
        scrollTop: $(divID).offset().top
    }, 1000);
  });
});
