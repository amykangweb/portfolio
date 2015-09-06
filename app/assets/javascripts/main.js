$(document).ready(function() {
  var status = "false";
  $(document).foundation();
  $('#Grid').mixitup(); // needed for our work section
  $("#filter li").click(function () {
      $("#filter li").removeClass("active-filter");
      $(this).addClass("active-filter");
  });
  $("#menu-close").click(function (e) {
      e.preventDefault();
      $("#sidebar-wrapper").toggleClass("active");
  });

  $("#menu-toggle").click(function (e) {
      e.preventDefault();
      $("#sidebar-wrapper").toggleClass("active");
  });

  function spell_out(i) {
      var word = "Hi there, We love to hear from you";
      $(".spell-out").text(word.substring(0, i));
      if (i < word.length) {
          setTimeout("spell_out(" + (i + 1) + ")", 80);

      }
  }
  $('#contact-info').waypoint(function () {
      if (status == "false") {
          status = "true";
          $(".spell-out").css('visibility', 'visible');
          spell_out(0);
      }
  }, { offset: 100 });

  $(function () {
      // var current = $("#myTabs .active a").attr("href");
      $('.sidebar-nav a[href*=#]:not([href=#])').click(function () {
          if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

              var target = $(this.hash);
              target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
              if (target.length) {
                  $('html,body').animate({
                      scrollTop: target.offset().top
                  }, 1000);
                  return false;
              }
          }
      });
  });

});
