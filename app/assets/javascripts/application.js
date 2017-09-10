// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require foundation
//= require sticky_kit
//= require jquery.dotdotdot.min
//= require social-share-button
//= require_tree .

$(document).foundation();
$(function(){ $(document).foundation(); });

$(document).ready(function(){


  $(".preview-text").dotdotdot({
  });

  $(".side-title").dotdotdot({});

  $('.alert-close').click(function(){
    console.log('Close Clicked')
    $(this).parent().fadeOut();
  })
  
  // $('.banner-img').each(function(){
  //   var height = $(this).height();
  //   var parentHeight = $(this).parents("div:first").height();
  //   var diff = height - parentHeight;
  //   $(this).css('margin-top', -diff/4); 
  // })
    var $window = $(window);
    if ($('#sticky-top').length) {

    colTop = $('#sticky-top').offset().top;
    navHeight = $("#responsive-menu").height()
    diff = colTop - navHeight;

    $window.scroll(function() {
      if ($window.scrollTop() > diff) {
        var slideDown = $window.scrollTop() - diff;
        if (slideDown <= navHeight) { var compMargin = slideDown } else { var compMargin = navHeight}
        $('#sticky-top').css('margin-top', compMargin);
        $('#sticky-top').stick_in_parent();
      }
      else {
        $('#sticky-top').css('margin-top', 0);
      }
      });
    }

    $stickyMenu = $('#responsive-menu');

    menuTop = $stickyMenu.offset().top;

    $window.scroll(function() {
      if($window.scrollTop() > menuTop) {
        $stickyMenu.stick_in_parent();
      }
    })

    $stickyBottom = $('#sticky-bottom')

    if ($stickyBottom.length) {
      colBottom = $stickyBottom.offset().top + $stickyBottom.outerHeight(true);

      $window.scroll(function () {
        var scrollBottom = $(window).scrollTop() + $(window).height();
        if (scrollBottom > colBottom) {
          $stickyBottom.stick_in_parent();
        }
      })
    }
})
