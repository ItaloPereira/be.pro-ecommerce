/**
 * Import Libs
 */
import Vue from 'vue';
import Vuex from 'vuex';

/**
 * Import Modules
 */
import productsModule from './modules/products';
import headerSlidesModule from './modules/header-slides';
import partnersSlidesModule from './modules/partners-slides';

/**
 * Instance Vuex
 */
Vue.use(Vuex);

/**
 * Export Store
 */
export default new Vuex.Store({
    modules: {
        products: productsModule,
        headerSlides: headerSlidesModule,
        partnersSlides: partnersSlidesModule
    }
});
