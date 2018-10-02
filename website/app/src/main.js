import Vue from 'vue';
import { sync } from 'vuex-router-sync';
import vbclass from 'vue-body-class';

import ApiService from '@/api';

import router from './router';
import store from './store';
import App from './App';

Vue.config.productionTip = false;
ApiService.init();

sync(store, router);
Vue.use(vbclass, router);

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app');
