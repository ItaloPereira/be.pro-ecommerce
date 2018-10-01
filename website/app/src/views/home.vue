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
                <ProductGrid columns="4">

                    <Product
                    v-for="product in products"
                    :key="product.id"
                    :type="product.type"
                    :title="product.title"
                    :subtitle="product.type == 0 ? product.subtitle : ''"
                    :icon="product.type == 0 ? product.icon : ''"
                    :badge="product.badge ? product.badge : ''"
                    :badgeDirection="product.badge ? product.badgeDirection : ''"
                    :oldPrice="product.oldPrice == 1 ? product.oldPrice : ''"
                    :price="product.type == 1 ? product.price : ''"
                    :productImage="product.type == 1 ? product.productImage : ''"
                    :theme="product.theme ? product.theme : ''"/>



                    <!-- <Product
                    type="0"
                    icon="fire"
                    title="POPULAR PRODUCT"
                    subtitle="More Product"/>

                    <Product
                    type="1"
                    title="Flecked cotton-blend"
                    price="$175.00 USD"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    badge="sale"
                    title="Flecked cotton-blend"
                    oldPrice="$200.00 USD"
                    badgeDirection="right"
                    price="$175.00 USD"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    title="Flecked cotton-blend"
                    price="$175.00 USD"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    badge="free"
                    badgeDirection="right"
                    title="Flecked cotton-blend"
                    price="$0.00 USD"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    badge="new"
                    badgeDirection="left"
                    title="Striped cotton"
                    price="$50.00 USD"
                    theme="blue-theme"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    badge="old"
                    badgeDirection="right"
                    title="Striped cotton"
                    oldPrice="$75.00 USD"
                    price="$50.00 USD"
                    theme="blue-theme"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    title="Striped cotton"
                    price="$50.00 USD"
                    theme="blue-theme"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    title="Flecked cotton-blend"
                    price="$175.00 USD"
                    badge="asf"
                    badgeDirection="right"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    title="Flecked cotton-blend"
                    price="$175.00 USD"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    title="Flecked cotton-blend"
                    price="$175.00 USD"
                    productImage="http://localhost:3030/img/product.png"/>

                    <Product
                    type="1"
                    title="Flecked cotton-blend"
                    badge="freela"
                    badgeDirection="left"
                    price="$175.00 USD"
                    productImage="http://localhost:3030/img/product.png"/> -->
                </ProductGrid>
                <!-- <div class="swiper-container">
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
                </div> -->
            </div>
        </div>
    </section>
</template>

<script>
// libs
import Swiper from 'swiper';

// components
// import { mapGetters, mapActions } from 'vuex';
import ProductGrid from '../components/product-grid';
import Product from '../components/product';

export default {
    name: 'Home',
    components: {
        ProductGrid,
        Product
    },
    computed: {
        // ...mapGetters({
        //     products: 'products'
        // })
    },
    methods: {
        // ...mapActions(['getProducts'])
    },
    data() {
        return {
            slides: [
                {
                    id: 1,
                    type: '1',
                    textBack: 'FASHION',
                    title: 'New Arrival',
                    buttonText: 'BUY NOW',
                    bgrImg: 'http://localhost:3030/img/bgr-header.png'
                },
                {
                    id: 2,
                    type: '1',
                    textBack: 'FREEEEE',
                    title: 'Old Arrival',
                    buttonText: 'BUY NOW 2',
                    bgrImg: 'http://localhost:3030/img/bgr-header.png'
                },
                {
                    id: 3,
                    type: '1',
                    textBack: 'EWGERG',
                    title: 'Free Arrival',
                    buttonText: 'BUY NOW 3',
                    bgrImg: 'http://localhost:3030/img/bgr-header.png'
                }
            ]
        };
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
        // eslint-disable-next-line
        console.log(this.$store.getters.homePage);
        // this.getProducts();
    }
};
</script>
