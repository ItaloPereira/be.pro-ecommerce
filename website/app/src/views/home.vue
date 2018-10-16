<template>
    <section class="page home">
        <div class="home-header">
            <Slider :slides="slides.data" type="0"/>
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
                    v-for="product in productList"
                    :key="product.id"
                    :data="product"/>
                </ProductGrid>
                <LoadMore v-if="products.pagination && !products.pagination.isLastPage" @click="getNextProductsPage" :isLoading="isLoading"/>
            </div>
        </div>
    </section>
</template>

<script>
// libs
import Swiper from 'swiper';

// components
import { mapGetters, mapActions } from 'vuex';
import Slider from '../components/slider';
import ProductGrid from '../components/product-grid';
import Product from '../components/product';
import LoadMore from '../components/load-more';

export default {
    name: 'Home',
    components: {
        Slider,
        ProductGrid,
        Product,
        LoadMore
    },
    data() {
        return {
            isLoading: false,
            productList: []
        };
    },
    computed: {
        ...mapGetters({
            products: 'products',
            slides: 'slides'
        })
    },
    methods: {
        ...mapActions(['getProducts', 'getSlides']),
        getNextProductsPage() {
            this.getProducts(this.products.pagination.links.next);
            this.isLoading = true;
        }
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
        this.getProducts(`limit=12&offset=0`);
        this.getSlides();
    },
    updated() {
        document.querySelector('.swiper-container').swiper.update();
    },
    watch: {
        products(list) {
            this.productList = [...this.productList, ...list.data];
            this.isLoading = false;
        }
    }
};
</script>
