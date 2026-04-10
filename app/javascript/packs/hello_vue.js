import Vue from 'vue'
import Axios from 'axios'
import FavoriteButton from '../src/FavoriteButton.vue'
import FollowButton from '../src/FollowButton.vue' //フォローボタン用の追加


document.addEventListener('DOMContentLoaded', () => {

  // セキュリティ（CSRFトークン）の共通設定
  const tokenElem = document.querySelector('meta[name="csrf-token"]')
  if (tokenElem) {
    Axios.defaults.headers.common['X-CSRF-Token'] = tokenElem.getAttribute('content')
  }


  // ① いいねボタン（FavoriteButton）の初期設定

  const favoriteSelector = 'favorite-button-component'
  const favoriteElements = document.getElementsByClassName(favoriteSelector)

  Array.from(favoriteElements).forEach(element => {
    const blogId = parseInt(element.getAttribute('data-blog-id'))
    const favorited = element.getAttribute('data-favorited') === 'true'
    const count = parseInt(element.getAttribute('data-count'))

    new Vue({
      render: h => h(FavoriteButton, {
        props: {
          blogId: blogId,
          defaultFavorited: favorited,
          defaultCount: count
        }
      })
    }).$mount(element)
  })


  // ② フォローボタン（FollowButton）の初期設定

  // （window.mountFollowButtons）を登録するコード
  window.mountFollowButtons = () => {
    const followSelector = 'follow-button-component'
    const followElements = document.getElementsByClassName(followSelector)

    Array.from(followElements).forEach(element => {
      const userId = parseInt(element.getAttribute('data-user-id'))
      const following = element.getAttribute('data-following') === 'true'

      new Vue({
        render: h => h(FollowButton, {
          props: {
            userId: userId,
            defaultFollowing: following
          }
        })
      }).$mount(element)
    })
  }

  // 画面を開いた最初の1回目は、ここで呼び出しておく
  window.mountFollowButtons()
})



import GalleryApp from '../GalleryApp.vue'

document.addEventListener('DOMContentLoaded', () => {
  // querySelectorAllにすることで、class名で全部探す
  const appElements = document.querySelectorAll('.vue-gallery-app');

  // 見つけた要素の数だけループ（forEach）してVueを立ち上げる
  appElements.forEach((el) => {
    const pageCategory = el.dataset.category;

    new Vue({
      render: h => h(GalleryApp, {
        props: { category: pageCategory }
      })
    }).$mount(el) //　見つけたその場所（el）に直接合体させる
  });
});