<template>
    <div>
        <div class="products-container" :style="`grid-template-columns:${calcColumn()}`">
            <slot></slot>
        </div>
    </div>
</template>

<script>
export default {
    name: 'ProductGrid',
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
