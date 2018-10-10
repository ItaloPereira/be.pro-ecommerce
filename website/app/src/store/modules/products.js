import { ProductsService } from '@/api';

const defaultState = {
    products: []
};

const actions = {
    getProducts: (context, data) => {
        ProductsService.getProducts(data.limit, data.offset)
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
