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


//ハンバーガーメニュー
$(function() {
  $(document).on('click', '#menu-trigger', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });

  $(document).on('click', '#sp-menu ul li', function() {
    $('#menu-trigger').removeClass('active');
    $('#sp-menu').fadeOut();
  });

  $(document).on('turbolinks:before-cache', function() {
    $('#menu-trigger').removeClass('active');
    $('#sp-menu').hide();
  });

  // --- 戻るボタン ---
  $(document).on('click', '#back a', function() {
    $('body, html').animate({
      scrollTop: 0
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


// スクロール画面
window.addEventListener('scroll', function(){
  const scroll = window.scrollY;
  const windowHeight = window.innerHeight;
  const boxes = document.querySelectorAll('.movement');

  boxes.forEach(function(movement) {
    const distanceToBox = movement.offsetTop;
    if(scroll + windowHeight > distanceToBox) {
      movement.classList.add('is-active');
    }
  });
});


// スライドショー
window.addEventListener('load', function() {
  const slideWrapper = document.querySelector('.slide-wrapper');
  
  // スライドショーが無いページでは終了
  if (!slideWrapper) return; 

  const slides = document.querySelectorAll('.slide > div');
  const indicators = document.querySelectorAll('.indicator .list');
  const prevBtn = document.getElementById('front');
  const nextBtn = document.getElementById('after');
  
  let currentIndex = 0; // 現在表示しているスライド番号
  let autoPlayInterval;
  const fadeSpeed = 5000; // 自動切替の秒数

  // --- 初期化処理 ---
  function initSlide() {
    // 最初のスライドとインジケーターを表示状態にする
    slides[0].classList.add('active');
    indicators[0].classList.add('active');
    startAutoPlay();
  }

  // --- スライド切り替え関数 ---
  function showSlide(index) {
    // すべてのスライドとインジケーターから active を外す
    slides.forEach(slide => slide.classList.remove('active'));
    indicators.forEach(indicator => indicator.classList.remove('active'));

    // 指定された番号に active をつける（CSSのtransitionでふわっと変わる）
    slides[index].classList.add('active');
    indicators[index].classList.add('active');
    
    currentIndex = index; // 現在地を更新
  }

  // --- 次へ ---
  function nextSlide() {
    let newIndex = currentIndex + 1;
    if (newIndex >= slides.length) {
      newIndex = 0; // 最後まで行ったら最初に戻る
    }
    showSlide(newIndex);
  }

  // --- 前へ ---
  function prevSlide() {
    let newIndex = currentIndex - 1;
    if (newIndex < 0) {
      newIndex = slides.length - 1; // 最初より前なら最後に戻る
    }
    showSlide(newIndex);
  }

  // --- 自動再生 ---
  function startAutoPlay() {
    autoPlayInterval = setInterval(nextSlide, fadeSpeed);
  }

  function stopAutoPlay() {
    clearInterval(autoPlayInterval);
  }

  function resetAutoPlay() {
    stopAutoPlay();
    startAutoPlay();
  }

  // --- イベントリスナー設定 ---
  
  // 次へボタン
  if (nextBtn) {
    nextBtn.addEventListener('click', () => {
      nextSlide();
      resetAutoPlay();
    });
  }

  // 前へボタン
  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      prevSlide();
      resetAutoPlay();
    });
  }

  // インジケーター（丸ポチ）クリック
  indicators.forEach((indicator, index) => {
    indicator.addEventListener('click', () => {
      showSlide(index);
      resetAutoPlay();
    });
  });

  // タブが非表示になったら停止（省エネ）
  document.addEventListener('visibilitychange', () => {
    if (document.hidden) stopAutoPlay();
    else startAutoPlay();
  });

  // 実行開始
  initSlide();
});