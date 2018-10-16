 <template>
    <div class="product-container">
        <a href="javascript:;" class="product-ads" v-if="data.type == 0">
            <div class="ads-content">
                <i :class="`ads-icon icob-${data.icon}`"></i>
                <h3>{{ data.title }}</h3>
                <div class="ads-subtitle">
                    <span>{{ data.subtitle }}</span>
                    <i class="icob-arrow-right"></i>
                </div>
            </div>
        </a>
        <a href="javascript:;" class="product-show" v-if="data.type == 1" :class="data.theme ? data.theme + '-theme' : ''">
            <div class="product-content">
                <div class="product-badge" :class="data.badge_direction == 'right' ? 'to-right ' : 'to-left'" v-if="data.badge">{{ data.badge }}</div>
                <div class="product-img" :style="`background-image: url(${data.product_image})`"></div>
                <h4 class="product-title">{{ data.title }}</h4>
                <span class="product-old-price" v-if="data.old_price">${{ data.old_price }}.00 USD</span>
                <span class="product-price">${{ data.price }}.00 USD</span>
            </div>
        </a>
    </div>
</template>

<script>
export default {
    name: 'Product',
    props: ['data']
};
</script>
