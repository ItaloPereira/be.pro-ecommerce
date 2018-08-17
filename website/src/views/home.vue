<template>
    <section class="page home">
        <div class="home-header">
            <div class="page-wrapper">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">Slide 1</div>
                        <div class="swiper-slide">Slide 2</div>
                    </div>
                    <div class="swiper-button-prev icob-arrow-left"></div>
                    <div class="swiper-button-next icob-arrow-right"></div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import Swiper from 'swiper';

export default {
    name: 'Home',
    mounted() {
        // eslint-disable-next-line
        const swiper = new Swiper('.swiper-container', {
            direction: 'horizontal',
            slidesPerView: 'auto',
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            }
        });
    },
    data() {
        return {
            slides: [
                {
                    type: '1',
                    textBack: 'FASHION',
                    textFront: 'New Arrival',
                    textButton: 'BUY NOW',
                    imgCenter: ''
                },
                {
                    type: '1',
                    textBack: 'FASHION',
                    textFront: 'New Arrival',
                    textButton: 'BUY NOW',
                    imgCenter: ''
                }
            ]
        };
    }
};
</script>
