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


// ハンバーガー
$(function() {
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
window.addEventListener('load', function(){
  const slideContainer = document.querySelector('.slide');
  const prev = document.getElementById('prev');
  const after = document.getElementById('after');
  const indicator = document.getElementById('indicator');
  const slides = document.querySelectorAll('.slide > div');
  const totalSlides = slides.length;

  // 元スライドを保持（CSSでつけた色も取得）
  const slideColors = Array.from(slides).map(slide =>
  window.getComputedStyle(slide).backgroundColor
  );

  // クローン作成
  const firstClone = slides[0].cloneNode(true);
  const lastClone = slides[totalSlides - 1].cloneNode(true);

  // クローンに背景色をコピー
  firstClone.style.backgroundColor = slideColors[0];
  lastClone.style.backgroundColor = slideColors[totalSlides - 1];

  // スライドにクローンを追加
  slideContainer.appendChild(firstClone);
  slideContainer.insertBefore(lastClone, slides[0]);

  // クローンを含めた全スライドを取得
  const allSlides = slideContainer.querySelectorAll('div');
  const totalWithClone = allSlides.length;

  // 幅計算
  slideContainer.style.width = `${totalWithClone * 100}%`;
  allSlides.forEach(slide => slide.style.width = `${100 / totalWithClone}%`);

  // 元スライドとクローンの背景色を再設定
  allSlides.forEach((slide, i) => {
  if (i === 0) slide.style.backgroundColor = slideColors[totalSlides - 1];
  else if (i === allSlides.length - 1) slide.style.backgroundColor = slideColors[0];
  else slide.style.backgroundColor = slideColors[i - 1];
  });

  let count = 1;
  let isAnimating = false;
  let autoPlayInterval;

  // 初期位置
  slideContainer.style.transform = `translateX(-${count * 100 / totalWithClone}%)`;

  function updateSlidePosition(withTransition = true) {
  slideContainer.style.transition = withTransition ? 'transform 0.5s' : 'none';
  slideContainer.style.transform = `translateX(-${count * 100 / totalWithClone}%)`;
  if (withTransition) isAnimating = true;
  }

  // インジケーター更新
  function updateIndicator() {
  const activeIndex = (count - 1 + totalSlides) % totalSlides;
  document.querySelectorAll('.list').forEach((li, i) => {
  li.style.backgroundColor = i === activeIndex ? '#000' : '#fff';
  });
  }

  // スライド操作
  function nextSlide() {
  if (isAnimating) return;
  count++;
  updateSlidePosition();
  updateIndicator();
  }

  function prevSlide() {
  if (isAnimating) return;
  count--;
  updateSlidePosition();
  updateIndicator();
  }

  // transition後のループ補正
  slideContainer.addEventListener('transitionend', () => {
  if (count === totalWithClone - 1) count = 1;
  if (count === 0) count = totalSlides;
  updateSlidePosition(false);
  isAnimating = false;
  });

  // 自動スライド
  function startAutoPlay() {
  autoPlayInterval = setInterval(nextSlide, 5000);
  }
  function stopAutoPlay() { clearInterval(autoPlayInterval); }
  startAutoPlay();

  // ボタン操作
  after.addEventListener('click', () => { nextSlide(); resetAutoPlay(); });
  prev.addEventListener('click', () => { prevSlide(); resetAutoPlay(); });

  function resetAutoPlay() {
  stopAutoPlay();
  startAutoPlay();
  }

  // インジケーター操作
  indicator.addEventListener('click', (e) => {
  if (!e.target.classList.contains('list')) return;
  if (isAnimating) return;
  const index = Array.from(indicator.children).indexOf(e.target);
  count = index + 1;
  updateSlidePosition();
  updateIndicator();
  resetAutoPlay();
  });

  // タブ切替時に自動スライドを停止/再開
  document.addEventListener('visibilitychange', () => {
  if (document.hidden) stopAutoPlay();
  else startAutoPlay();
  });
});