$(document).scroll(function(){
  var a = $("body").offset().top;
  console.log(a);
    if($(this).scrollTop() === 0)
  {
    $('.navbar-inverse').css('background-color', 'transparent');
    $('.navbar-inverse').css('border-color', 'transparent');
  } else {
    $('.navbar-inverse').css('background-color', 'rgba(0, 0, 0, 0.85)');
    $('.navbar-inverse').css('border-color', 'rgba(0, 0, 0, 0.85)');
  }
});
