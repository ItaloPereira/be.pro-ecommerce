import { SlidesService } from '@/api';

const defaultState = {
    slides: []
};

const actions = {
    getSlides: context => {
        SlidesService.getSlides()
            .then(response => {
                context.commit('SLIDES_UPDATE', response);
            })
            .catch(error => {
                // eslint-disable-next-line
                console.error(error);
            });
    }
};

const mutations = {
    SLIDES_UPDATE: (state, payload) => {
        state.slides = payload.data.slides;
    }
};

const getters = {
    slides: state => state.slides
};

export default {
    state: defaultState,
    actions,
    mutations,
    getters
};
