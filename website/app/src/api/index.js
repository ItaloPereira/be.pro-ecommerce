import Vue from 'vue';
import axios from 'axios';
import VueAxios from 'vue-axios';

// Api Service
const ApiService = {
    init() {
        Vue.use(VueAxios, axios);
        Vue.axios.defaults.baseURL = process.env.API_URL;
    },

    setHeader() {
        Vue.axios.defaults.headers.common.Authorization = `Token ${
            process.env.API_URL
        }`;
    },

    query(resource, params) {
        return Vue.axios.get(resource, params).catch(error => {
            throw new Error(`ApiService ${error}`);
        });
    },

    get(resource) {
        return Vue.axios.get(`${resource}`).catch(error => {
            throw new Error(`ApiService ${error}`);
        });
    },

    post(resource, params) {
        return Vue.axios.post(`${resource}`, params);
    },

    update(resource, params) {
        return Vue.axios.put(`${resource}`, params);
    },

    put(resource, params) {
        return Vue.axios.put(`${resource}`, params);
    },

    delete(resource) {
        return Vue.axios.delete(resource).catch(error => {
            throw new Error(`ApiService ${error}`);
        });
    }
};
export default ApiService;

// App Services
export const ProductsService = {
    getProducts() {
        return ApiService.get('/products');
    }
};

export const SlidesService = {
    getSlides() {
        return ApiService.get('/slides');
    }
};
