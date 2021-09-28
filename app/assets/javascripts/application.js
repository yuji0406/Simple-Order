// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function () {
  $('#js-review-btn').on('click', function () {
    $('.js-modal').fadeIn();
    return false;
  });
  $('.js-modal-close').on('click', function () {
    $('.js-modal').fadeOut();
    return false;
  });

  $('.js-hover').hover(function (){
    $(this).find('span,i').css({
      color: "white"
    });
  },function () {
  $(this).find('span,i').css({
    color: ""
    });
  });

  $(function () {
    $('.menu-trigger').on('click', function(event) {
      $(this).toggleClass('active');
      $('.right-navbar').fadeToggle();
      $('.right-navbar').toggleClass('active')
      $('.right-navbar').find('ul').toggleClass('navbar');
      event.preventDefault();
    });
  });

   $(".shop-contents").hover(function () {
    $(this).find(".shop-info").css({
      color: "white"
    });
    $(this).css({
      "background-color": "rgb(235,97,1)"
    });
  },function () {
    $(this).find(".shop-info").css({
      color: ""
    });
    $(this).css({
      "background-color": ""
    });
  });

  $(".sale-only-btn").on('click', function () {
    $(".sold-out-box").hide();
    $(this).hide();
    $('.all-item-btn').show();
  });

  $(".all-item-btn").on('click', function () {
    $(".sold-out-box").show();
    $(this).hide();
    $('.sale-only-btn').show();
  });

  $(function() {
    $('#page-top a').on('click', function(event) {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      event.preventDefault();
    });
  });
});




