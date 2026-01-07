import Vue from 'vue'
import Axios from 'axios'
import FavoriteButton from '../src/FavoriteButton.vue'

document.addEventListener('DOMContentLoaded', () => {

  const tokenElem = document.querySelector('meta[name="csrf-token"]')
  if (tokenElem) {
    Axios.defaults.headers.common['X-CSRF-Token'] = tokenElem.getAttribute('content')
  }

  const selector = 'favorite-button-component'
  const elements = document.getElementsByClassName(selector)

  Array.from(elements).forEach(element => {
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
})