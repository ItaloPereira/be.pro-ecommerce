<template>
    <section class="page home">
        <div class="home-header">
            <div class="swiper-container">
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
        <div class="home-content">
            <div class="page-wrapper2">
                <div class="benefits-container">
                    <div class="benefits">
                        <div class="benefit">
                            <div class="benefit-box">
                                <i class="icob-truck"></i>
                                <div class="benefit-desc">
                                    <h6>Free Shipping</h6>
                                    <span>Orders over $99</span>
                                </div>
                            </div>
                        </div>
                        <div class="benefit">
                            <div class="benefit-box">
                                <i class="icob-refresh-ccw"></i>
                                <div class="benefit-desc">
                                    <h6>30 days return</h6>
                                    <span>If goods have problem</span>
                                </div>
                            </div>
                        </div>
                        <div class="benefit">
                            <div class="benefit-box">
                                <i class="icob-credit-card"></i>
                                <div class="benefit-desc">
                                    <h6>Secure payment</h6>
                                    <span>100% secure payment</span>
                                </div>
                            </div>
                        </div>
                        <div class="benefit">
                            <div class="benefit-box">
                                <i class="icob-user"></i>
                                <div class="benefit-desc">
                                    <h6>24h support</h6>
                                    <span>Dedicated Support</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <ProductGrid columns="4" :lastPage="products.pagination && products.pagination.isLastPage">

                    <Product
                    v-for="product in products.products"
                    :key="product.id"
                    :type="product.type"
                    :title="product.title"
                    :subtitle="product.subtitle"
                    :icon="product.icon"
                    :badge="product.badge"
                    :badgeDirection="product.badgeDirection"
                    :oldPrice="product.oldPrice"
                    :price="product.price"
                    :productImage="product.productImage"
                    :theme="product.theme"/>

                </ProductGrid>
            </div>
        </div>
    </section>
</template>

<script>
// libs
import Swiper from 'swiper';

// components
import { mapGetters, mapActions } from 'vuex';
import ProductGrid from '../components/product-grid';
import Product from '../components/product';

export default {
    name: 'Home',
    components: {
        ProductGrid,
        Product
    },
    computed: {
        ...mapGetters({
            products: 'products',
            slides: 'slides'
        })
    },
    methods: {
        ...mapActions(['getProducts', 'getSlides'])
    },
    mounted() {
        // eslint-disable-next-line
        const swiper = new Swiper('.swiper-container', {
            direction: 'horizontal',
            slidesPerView: 'auto',
            parallax: true,
            speed: 700,
            navigation: {
                nextEl: '.swiper-navigation .swiper-button-next',
                prevEl: '.swiper-navigation .swiper-button-prev'
            }
        });
        this.getProducts(0);
        this.getSlides();
    },
    updated() {
        document.querySelector('.swiper-container').swiper.update();
    }
};
</script>
