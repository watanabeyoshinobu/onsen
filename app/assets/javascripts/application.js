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
//
//= require rails-ujs
//= require activestorage
  //= require jquery
  //= require jquery_ujs
  //= require bootstrap-sprockets
//= require_tree .


// スライドショー
$(function() {

  $(document).ready(function () {
    $("#theTarget").skippr({
      transition : 'fade',
      speed : 2000,
      easing : 'easeOutQuart',
      navType : 'bubble',
      childrenElementType : 'div',
      arrows : true,
      autoPlay : true,
      autoPlayDuration : 4000,
      keyboardOnAlways : true,
      hidePrevious : false
    });
  });

// ハンバーガー
  $('#menu-trigger').on('click', function() {
    $(this).toggleClass('active')
    $('#sp-menu').fadeToggle();
    return false;
  });

  $('#sp-menu ul li').on('click', function(){
    $('#menu-trigger').toggleClass('active')
    $('#sp-menu').fadeToggle();
  });

});

// 戻るボタン
$(function() {

  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 800);
      return false;
  });

});


$(function(){
  $('.introduce-visual .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.introduce-visual .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.introduce-visual').addClass('is-visible');
});


$(function(){
  $('.introduce-visual2 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.introduce-visual2 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.introduce-visual2').addClass('is-visible');
});


