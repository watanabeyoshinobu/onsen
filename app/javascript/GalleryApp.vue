<template>
  <div class="gallery-container">
    <div class="vue-gallery-grid">
      <div v-for="(item, index) in items" :key="index" class="gallery-item fade-up-item" @click="openModal(item)">
        <figure class="gallery-figure">
          <img :src="'/assets/' + item.image_filename" :alt="item.name" class="gallery-image" />
          <figcaption class="gallery-caption">{{ item.name }}</figcaption>
        </figure>
      </div>
    </div>

    <div v-if="selectedItem" class="modal-overlay" @click="closeModal">
      <div class="modal-content" @click.stop>
        <img :src="'/assets/' + selectedItem.image_filename" :alt="selectedItem.name" />
        <h3 class="modal-title">{{ selectedItem.name }}</h3>
        <p class="modal-desc">{{ selectedItem.description }}</p>
        <button @click="closeModal" class="btn btn-dark mt-3">閉じる</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['category'],
  data() {
    return {
      items: [],
      selectedItem: null,
      observer: null // スクロール検知用のオブザーバー
    }
  },
  mounted() {
    fetch(`/api/gallery_items?category=${this.category}`)
      .then(response => response.json())
      .then(data => {
        this.items = data;
        // データが入り、HTMLが描画された直後にオブザーバーを起動
        this.$nextTick(() => {
          this.setupObserver();
        });
      });
  },
  destroyed() {
    // コンポーネント破棄時に監視を解除
    if (this.observer) {
      this.observer.disconnect();
    }
  },
  methods: {
    setupObserver() {
      const options = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1 // 要素が10%見えたら発火
      };

      this.observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            observer.unobserve(entry.target);
          }
        });
      }, options);

      const elements = this.$el.querySelectorAll('.fade-up-item');
      elements.forEach(el => this.observer.observe(el));
    },
    openModal(item) {
      this.selectedItem = item;
      document.body.style.overflow = 'hidden';
    },
    closeModal() {
      this.selectedItem = null;
      document.body.style.overflow = '';
    }
  }
}
</script>

<style scoped>
/* --- レイアウト用のCSS --- */
.gallery-container {
  width: 100%;
}

.vue-gallery-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 50px 30px;
  place-items: center;
  width: 1000px;
  margin: 0 auto; 
}

.gallery-item {
  width: 100%;
  text-align: center;
}


.fade-up-item {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.fade-up-item.is-visible {
  opacity: 1;
  transform: translateY(0);
}

.gallery-figure {
  width: 300px;
  height: 250px;
  margin: 0 auto;
  cursor: pointer;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.gallery-figure:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.gallery-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 4px;
}

.gallery-caption {
  margin-top: 15px;
  font-size: 14px;
  color: #fff;
  font-weight: bold;
  text-align: center;
}

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 1000;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 0; 
}

.modal-content {
  background-color: white;
  padding: 30px;
  border-radius: 8px;
  width: 90%;
  max-width: 600px;
  max-height: 90vh;
  overflow-y: auto;
  text-align: center;
  box-sizing: border-box;
  margin-top: 80px;
}

.modal-content img {
  width: 100%;
  height: auto;
  max-height: 50vh;
  object-fit: cover;
  margin-bottom: 20px;
  border-radius: 4px;
}

.modal-title {
  color: #5d4037;
  margin: 20px 0 15px;
  font-size: 24px;
  border-bottom: 2px solid #e6b422;
  display: inline-block;
}

.modal-desc {
  font-size: 16px;
  line-height: 1.6;
  margin-bottom: 25px;
}

/* --- スマホ用レスポンシブ --- */
@media (max-width: 768px) {
  .vue-gallery-grid {
    width: 100%;
    grid-template-columns: 1fr;
    gap: 30px;
  }

  .gallery-figure {
    width: 90%;
    max-width: 300px;
    height: 60vw;
    max-height: 250px;
    margin-bottom: 20px;
  }

  .modal-content {
  margin-top: 20px;
}

}
</style>