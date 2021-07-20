import Vue from 'vue'
import App from '../app.vue'
import GoodsReceipt from '../components/documents/goods_receipt.vue'
import Quasar from 'quasar/dist/quasar.esm'
import 'quasar/dist/quasar.sass'

import iconSet from 'quasar/icon-set/material-icons'
import '@quasar/extras/material-icons/material-icons.css'


import '../vue/quasar'

Vue.use(Quasar)

Vue.component('app', App)
Vue.component('goods-receipt', GoodsReceipt)

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app'
  })
})
