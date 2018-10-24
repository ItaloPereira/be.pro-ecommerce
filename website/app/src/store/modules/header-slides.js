import { SlidesService } from '@/api';

const defaultState = {
    headerSlides: []
};

const actions = {
    getHeaderSlides: context => {
        SlidesService.getHeaderSlides()
            .then(response => {
                context.commit('HEADER_SLIDES_UPDATE', response);
            })
            .catch(error => {
                // eslint-disable-next-line
                console.error(error);
            });
    }
};

const mutations = {
    HEADER_SLIDES_UPDATE: (state, payload) => {
        state.headerSlides = payload.data;
    }
};

const getters = {
    headerSlides: state => state.headerSlides
};

export default {
    state: defaultState,
    actions,
    mutations,
    getters
};
