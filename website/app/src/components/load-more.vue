<template>
    <div :class="`load-more${isLoading ? ' animate' : ''}`" @click="getNextProductsPage">
        <i class="icob-refresh-cw"></i>
        <span>LOAD MORE</span>
    </div>
</template>

<script>
export default {
    name: 'LoadMore',
    props: ['isLoading'],
    methods: {
        getNextProductsPage() {
            this.$emit('click');
        }
    }
};
</script>
