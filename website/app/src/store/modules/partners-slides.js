import { SlidesService } from '@/api';

const defaultState = {
    partnersSlides: []
};

const actions = {
    getPartnersSlides: context => {
        SlidesService.getPartnersSlides()
            .then(response => {
                context.commit('PARTNERS_SLIDES_UPDATE', response);
            })
            .catch(error => {
                // eslint-disable-next-line
                console.error(error);
            });
    }
};

const mutations = {
    PARTNERS_SLIDES_UPDATE: (state, payload) => {
        state.partnersSlides = payload.data;
    }
};

const getters = {
    partnersSlides: state => state.partnersSlides
};

export default {
    state: defaultState,
    actions,
    mutations,
    getters
};
