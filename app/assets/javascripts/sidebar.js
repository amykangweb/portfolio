$(document).ready(function(){
  $("#menu-toggle").click(function(e) {
      console.log("hi");
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
      $('.fa-bars').toggleClass("sidebar-out");
  });
});
