<template>
    <div>
        <div class="products-container" :style="`grid-template-columns:${calcColumn()}`">
            <slot></slot>
        </div>
        <LoadMore/>
    </div>
</template>

<script>
// components
import LoadMore from './load-more';

export default {
    name: 'ProductGrid',
    components: {
        LoadMore
    },
    props: ['columns'],
    methods: {
        calcColumn() {
            let result = '';
            for (let i = 0; i < this.columns; i += 1) {
                result += 'auto ';
            }
            return result;
        }
    }
};
</script>
