<template>
    <section class="page home">
        <div class="home-header">
            <Slider :slides="slides.data"/>
        </div>
        <div class="home-content">
            <div class="page-wrapper2">
                <div class="benefits-container">
                    <div class="benefits">
                        <Benefit v-for="benefit in benefitsList" :key="benefit.id" :data="benefit"/>
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
import Slider from '../components/header-slider';
import Benefit from '../components/benefit-square';
import ProductGrid from '../components/product-grid';
import Product from '../components/product';
import LoadMore from '../components/load-more';

export default {
    name: 'Home',
    components: {
        Slider,
        Benefit,
        ProductGrid,
        Product,
        LoadMore
    },
    data() {
        return {
            isLoading: false,
            productList: [],
            benefitsList: [
                {
                    index: 0,
                    icon: 'truck',
                    descTitle: 'Free Shipping',
                    descText: 'Orders over $99'
                },
                {
                    index: 1,
                    icon: 'refresh-ccw',
                    descTitle: '30 days return',
                    descText: 'If goods have problem'
                },
                {
                    index: 2,
                    icon: 'credit-card',
                    descTitle: 'Secure payment',
                    descText: '100% Secure payment'
                },
                {
                    index: 3,
                    icon: 'user',
                    descTitle: '24h support',
                    descText: 'Dedicated Support'
                }
            ]
        };
    },
    computed: {
        ...mapGetters({
            products: 'products',
            slides: 'slides'
        })
    },
    methods: {
        ...mapActions(['getProducts', 'getHeaderSlides']),
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
        this.getHeaderSlides();
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
