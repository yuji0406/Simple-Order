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
    $(this).css({
      "background-color": "rgb(235,97,1)",
      opacity: "1"
    });
  },function () {
  $(this).find('span,i').css({
    color: ""
    });
  $(this).css({
    "background-color": "",
    opacity: ""
    });
  });

  $(function () {
    $('.menu-trigger').on('click', function(event) {
      // $('.right-navbar').find('ul').toggleClass('active');
      $(this).toggleClass('active');
      $('.right-navbar').fadeToggle(300)
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

  $('#page-top').hover(function () {
    $(this).find("i").css({
      opacity: "1"
    });
  },function() {
      $(this).find("i").css({
      opacity: ""
      });
    });

  $(function() {
    $('#page-top a').on('click', function(event) {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      event.preventDefault();
    });
  });
// トップページアニメーション用⬇︎
  function EachTextAnimeControl() {
    $('.eachTextAnime').each(function () {
      var elemPos = $(this).offset().top - 50;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll >= elemPos - windowHeight) {
        $(this).addClass("appeartext");
      } else {
        $(this).removeClass("appeartext");
      }
    });
  }
  $(window).on('load', function () {
  var element = $(".eachTextAnime");
  element.each(function () {
    var text = $(this).text();
    var textbox = "";
    text.split('').forEach(function (t, i) {
      if (t !== " ") {
        if (i < 10) {
          textbox += '<span style="animation-delay:.' + i + 's;">' + t + '</span>';
        } else {
          var n = i / 10;
          textbox += '<span style="animation-delay:' + n + 's;">' + t + '</span>';
        }
      } else {
        textbox += t;
      }
    });
    $(this).html(textbox);
  });

  EachTextAnimeControl();
  });

  function fadeAnime(){
  $('.fadeUpTrigger').each(function(){
    var elemPos = $(this).offset().top;
    var scroll = $(window).scrollTop();
    var windowHeight = $(window).height();
    if (scroll >= elemPos - windowHeight){
    $(this).addClass('fadeUp');
    }else{
    $(this).removeClass('fadeUp');
    }
    });
  }
  $(window).scroll(function (){
    fadeAnime();
  });


  function FixedAnime() {
  var headerH = $('.header').outerHeight(true);
  var scroll = $(window).scrollTop();
  if (scroll >= headerH){
      $('.header').addClass('fixed');
    }else{
      $('.header').removeClass('fixed');
    }
  }

  $(window).scroll(function () {
  FixedAnime();
  });


// トップページ用アニメーションここまで

});




