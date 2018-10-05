<template>
    <div>
        <div v-if="type == 0" class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide" v-for="slide in slides" :key="slide.id">
                    <span
                    class="slide-text-back"
                    data-swiper-parallax-x="350"
                    data-swiper-parallax-opacity="0">{{ slide.textBack }}</span>
                    <div
                    class="slide-img-background"
                    :style="`background-image: url(${slide.bgrImg})`">
                        <div class="slide-title-box">
                            <h2
                            data-swiper-parallax-x="-350"
                            data-swiper-parallax-opacity="0">{{ slide.title }}</h2>
                            <button
                            type="button"
                            data-swiper-parallax-x="-650"
                            data-swiper-parallax-opacity="0">{{ slide.buttonText }}</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-navigation">
                <div class="swiper-button-prev icob-arrow-left"></div>
                <div class="swiper-button-next icob-arrow-right"></div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Slider',
    props: ['slides', 'type']
};
</script>
