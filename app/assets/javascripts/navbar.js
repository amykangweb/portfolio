$(document).scroll(function(){
  var a = $("body").offset().top;
  console.log(a);
    if($(this).scrollTop() === 0)
  {
    $('.main-navbar').css('background-color', 'transparent');
    $('.main-navbar').css('border-color', 'transparent');
  } else {
    $('.main-navbar').css('background-color', 'rgba(0, 0, 0, 0.85)');
    $('.main-navbar').css('border-color', 'rgba(0, 0, 0, 0.85)');
  }
});
