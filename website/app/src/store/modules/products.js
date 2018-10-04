import { ProductsService } from '@/api';

const defaultState = {
    products: []
};

const actions = {
    getProducts: (context, page) => {
        ProductsService.getProducts(page)
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
        state.products = payload.data;
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
