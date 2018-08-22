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
        <a href="javascript:;" class="product-show" v-if="type == 1">
            <div class="product-content">
                <div class="product-badge" v-if="badge">{{ badge }}</div>
                <div class="product-img" :style="`background-image: url(${productImage})`"></div>
                <h4 class="product-title">{{ title }}</h4>
                <span class="product-old-price" v-if="oldPrice">{{ oldPrice }}</span>
                <span class="product-price">{{ price }}</span>
            </div>
        </a>
        <a href="javascript:;" class="product-highlight" v-if="type == 2">
            <div class="highlight-content">
                <div class="highlight-badge" v-if="badge">{{ badge }}</div>
                <h4 class="highlight-suptitle">{{ suptitle }}</h4>
                <span class="highlight-title">{{ title }}</span>
                <button type="button"><span>{{ price }}</span><span>|</span><span>{{ buttonText }}</span></button>
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
        'suptitle',
        'buttonText'
    ]
};
</script>
