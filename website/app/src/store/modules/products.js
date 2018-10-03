import { ProductsService } from '@/api';

const defaultState = {
    products: []
};

const actions = {
    getProducts: context => {
        ProductsService.getProducts()
            .then(response => {
                context.commit('PRODUCTS_UPDATE', response);
            })
            .catch(error => {
                // eslint-disable-next-line
                console.error(error);
            });
    }
};

const mutations = {
    PRODUCTS_UPDATE: (state, payload) => {
        state.products = payload.data.products;
    }
};

const getters = {
    products: state => state.products
};

export default {
    state: defaultState,
    actions,
    mutations,
    getters
};
