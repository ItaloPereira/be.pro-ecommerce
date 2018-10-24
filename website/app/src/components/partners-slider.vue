<template>
    <div class="page-wrapper">
        <div class="partners-swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide" v-for="slide in slides" :key="slide.id">
                    <div class="bgr-image" :style="`background-image: url(${slide.partner_image});`">
                    </div>
                </div>
            </div>
            <div class="partners-swiper-navigation">
                <div class="swiper-button-prev icob-chevron-left"></div>
                <div class="swiper-button-next icob-chevron-right"></div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'PartnersSlider',
    props: ['slides']
};
</script>
