<template>
    <div class="benefit">
        <div class="benefit-box">
            <i :class="`icob-${data.icon}`"></i>
            <div class="benefit-desc">
                <h6>{{ data.descTitle }}</h6>
                <span>{{ data.descText }}</span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'BenefitSquare',
    props: ['data']
};
</script>
