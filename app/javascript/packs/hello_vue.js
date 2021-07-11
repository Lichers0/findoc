import Vue from 'vue'
import App from '../app.vue'

import '../vue/quasar'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    render: h => h(App)
  }).$mount('#app')
})
