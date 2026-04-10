<template>
  <button 
    :class="['user-btn', isFollowing ? 'btn-unfollow' : 'btn-follow']" 
    @click="toggleFollow"
  >
    <i class="fa" :class="isFollowing ? 'fa-check' : 'fa-user-plus'"></i>
    
    {{ isFollowing ? 'フォロー中' : 'フォローする' }}
  </button>
</template>

<script>
import axios from 'axios'

export default {
  // Railsから受け取るデータ（誰のボタンか、初期状態はフォロー中か）
  props: {
    userId: {
      type: Number,
      required: true
    },
    defaultFollowing: {
      type: Boolean,
      required: true
    }
  },
  data() {
    return {
      // 状態を管理する箱
      isFollowing: this.defaultFollowing 
    }
  },
  methods: {
    toggleFollow() {
      // 通信先のURL（Railsのルーティングに合わせて後で微調整する可能性があります）
      const url = `/users/${this.userId}/relationships`

      if (this.isFollowing) {
        // --- フォロー解除 (DELETE通信) ---
        axios.delete(url)
          .then(response => {
            this.isFollowing = false // 成功したら箱の中身をfalse（未フォロー）にする
          })
          .catch(error => {
            console.error('エラーが発生しました', error)
          })
      } else {
        // --- フォロー登録 (POST通信) ---
        axios.post(url)
          .then(response => {
            this.isFollowing = true // 成功したら箱の中身をtrue（フォロー中）にする
          })
          .catch(error => {
            console.error('エラーが発生しました', error)
          })
      }
    }
  }
}
</script>

<style scoped>
/* 念のため、いいねボタンと同じように余計なボタンの枠線を消すリセットを入れておく*/
button {
  background: none;
  border: none;
  cursor: pointer;
  outline: none;
  padding: 0;
  font-size: inherit;
  color: inherit;
}
</style>