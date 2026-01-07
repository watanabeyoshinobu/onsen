<template>
  <button 
    class="favorite-btn" 
    :class="{ active: isFavorited }" 
    @click="toggleFavorite"
  >
    <i class="fa" :class="isFavorited ? 'fa-heart' : 'fa-heart-o'" aria-hidden="true"></i>
    
    <span>{{ count }}</span>
  </button>
</template>

<script>
import axios from 'axios'

export default {
  // Railsから受け取るデータ
  props: {
    blogId: {
      type: Number,
      required: true
    },
    defaultFavorited: {
      type: Boolean,
      required: true
    },
    defaultCount: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      isFavorited: this.defaultFavorited, // 今いいねしているか
      count: this.defaultCount            // 今のいいね数
    }
  },
  methods: {
    toggleFavorite() {
      // APIのURLを作成（/blogs/1/favorites）
      const url = `/blogs/${this.blogId}/favorites`

      if (this.isFavorited) {
        // --- いいね解除 (DELETE) ---
        axios.delete(url)
          .then(response => {
            this.isFavorited = false
            this.count = response.data.count // サーバーから返ってきた正しい件数を入れる
          })
          .catch(error => {
            console.error('エラーが発生しました', error)
          })
      } else {
        // --- いいね登録 (POST) ---
        axios.post(url)
          .then(response => {
            this.isFavorited = true
            this.count = response.data.count // サーバーから返ってきた正しい件数を入れる
          })
          .catch(error => {
            console.error('エラーが発生しました', error)
            // ログインしていない等のエラーならログイン画面へ飛ばすなどの処理も可能
          })
      }
    }
  }
}
</script>

<style scoped>
/* ボタンのスタイルリセット（aタグっぽく見せるため） */
button {
  background: none;
  border: none;
  cursor: pointer;
  outline: none;
  padding: 0;
  font-size: inherit; /* 親の文字サイズを継承 */
  color: inherit;     /* 親の色を継承 */
}
</style>