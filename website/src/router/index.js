import Vue from 'vue';
import Router from 'vue-router';
import Index from '@/views/index';
import Login from '@/views/login';
import Home from '@/views/home';
import Catalog from '@/views/catalog';
import Product from '@/views/product';

Vue.use(Router);

export default new Router({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'index',
            component: Index
        },
        {
            path: '/login',
            name: 'login',
            component: Login
        },
        {
            path: '/home',
            name: 'home',
            component: Home
        },
        {
            path: '/catalog',
            name: 'catalog',
            component: Catalog
        },
        {
            path: '/product',
            name: 'product',
            component: Product
        }
    ]
});
