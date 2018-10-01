/**
 * Import Libs
 */
import Vue from 'vue';
import Vuex from 'vuex';

/**
 * Import Modules
 */
import productsModule from './modules/products';

/**
 * Instance Vuex
 */
Vue.use(Vuex);

/**
 * Export Store
 */
export default new Vuex.Store({
    modules: {
        products: productsModule
    }
});
