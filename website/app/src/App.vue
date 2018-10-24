<template>
    <article id="app">
        <Nav/>
        <router-view/>
        <PartnersSlider :slides="partnersSlides.data"/>
        <Footer/>
    </article>
</template>

<script>
// libs
import Swiper from 'swiper';

// components
import { mapGetters, mapActions } from 'vuex';
import { EventBus } from './utils/event-bus';
import Nav from './components/nav';
import Footer from './components/footer';
import PartnersSlider from './components/partners-slider';

export default {
    name: 'app',
    components: {
        Nav,
        PartnersSlider,
        Footer
    },
    computed: {
        ...mapGetters({
            partnersSlides: 'partnersSlides'
        })
    },
    methods: {
        ...mapActions(['getPartnersSlides'])
    },
    mounted() {
        // eslint-disable-next-line
        const swiper = new Swiper('.partners-swiper-container', {
            direction: 'horizontal',
            slidesPerView: 4,
            speed: 700,
            loop: false,
            navigation: {
                nextEl: '.partners-swiper-navigation .swiper-button-next',
                prevEl: '.partners-swiper-navigation .swiper-button-prev'
            }
        });

        this.getPartnersSlides();
        EventBus.$emit('app-mounted');
    },
    updated() {
        document.querySelector('.partners-swiper-container').swiper.update();
    }
};
</script>

<style src="@/assets/sass/main.sass" lang="sass">
</style>
