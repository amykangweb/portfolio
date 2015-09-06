$(document).ready(function() {
  var mab = (function () {
    'use strict';

    return {

      // Call events here
      run: function () {
        this.found(); // start foundation
        this.scrolling();
        this.filters();
      },
      found: function () {
        return $(document).foundation();
      },
      scrolling: function () {
        // To Top function
        $('.toTop').on('click', function () {
          $("html, body").animate({
            scrollTop: 0
          }, "slow");
          return false;
        });
      },
      filters: function () {
        // Portfolio
        $('ul#filter a').click(function () {
          // Remove class
          $('ul#filter .active').removeClass('active');
          $(this).parent().addClass('active');
          // find same class of menu
          var filterVal = $(this).text().toLowerCase().replace(' ', '-');
          if (filterVal == 'all') {
            // If click all execute this
            $('.portfolio_item').animate({
              opacity: 1
            }, 1000);
          } else {
            // Each all and filter values
            $('.portfolio_item').each(function () {
              // Hide
              if (!$(this).hasClass(filterVal)) {
                $(this).animate({
                  opacity: 0.1
                }, 1000);
                // Show
              } else {
                $(this).animate({
                  opacity: 1
                }, 1000);
              }
            });
          }
          return false;
        });
      }
    };
  })();

  mab.run(); // run web

});
