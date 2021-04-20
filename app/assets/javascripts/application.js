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
      autoPlayDuration : 5000,
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

// look画面
$(function(){
  $('.onsen-visual .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual').addClass('is-visible');
});


// see画面
$(function(){
  $('.onsen-visual2 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual2 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual2').addClass('is-visible');
});


// saw画面
$(function(){
  $('.onsen-visual3 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual3 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual3').addClass('is-visible');
});


// watch画面
$(function(){
  $('.onsen-visual4 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual4 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual4').addClass('is-visible');
});


// seeing画面
$(function(){
  $('.onsen-visual5 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual5 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual5').addClass('is-visible');
});


// looking画面
$(function(){
  $('.onsen-visual6 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual6 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual6').addClass('is-visible');
});


// check画面
$(function(){
  $('.onsen-visual7 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual7 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual7').addClass('is-visible');
});

// try画面
$(function(){
  $('.onsen-visual8 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual8 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual8').addClass('is-visible');
});

// gaze画面
$(function(){
  $('.onsen-visual9 .line').children().addBack().contents().each(function(){
    if (this.nodeType == 3) {
      var $this = $(this);
      $this.replaceWith($this.text().replace(/(\S)/g, '<span class="letter">$&</span>'));
    }
  });

  $('.onsen-visual9 .letter').each(function () {
    var letters = $(this).closest('.text').find('.letter');
    var index = $(letters).index(this);
    var time = index * 0.09;
    $(this).css('animation-delay', time + 's');
  });
});

$(window).on('load', function(){
  $('.onsen-visual9').addClass('is-visible');
});
