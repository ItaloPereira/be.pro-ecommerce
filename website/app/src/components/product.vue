 <template>
    <div class="product-container">
        <a href="javascript:;" class="product-ads" v-if="type == 0">
            <div class="ads-content">
                <i :class="`ads-icon icob-${icon}`"></i>
                <h3>{{ title }}</h3>
                <div class="ads-subtitle">
                    <span>{{ subtitle }}</span>
                    <i class="icob-arrow-right"></i>
                </div>
            </div>
        </a>
        <a href="javascript:;" class="product-show" v-if="type == 1" :class="theme ? theme + '-theme' : ''">
            <div class="product-content">
                <div class="product-badge" :class="badgeDirection == 'right' ? 'to-right ' : 'to-left'" v-if="badge">{{ badge }}</div>
                <div class="product-img" :style="`background-image: url(${productImage})`"></div>
                <h4 class="product-title">{{ title }}</h4>
                <span class="product-old-price" v-if="oldPrice">${{ oldPrice }}.00 USD</span>
                <span class="product-price">${{ price }}.00 USD</span>
            </div>
        </a>
    </div>
</template>

<script>
export default {
    name: 'Product',
    props: [
        'type',
        'title',
        'subtitle',
        'icon',
        'badge',
        'productImage',
        'oldPrice',
        'price',
        'badgeDirection',
        'theme'
    ]
};
</script>
