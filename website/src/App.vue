<template>
    <section id="app">
        <div class="nav-bar">
            <div class="page-wrapper">
                <div class="nav-part1">
                    <span>Be.Pro</span>
                    <ul class="nav-items1">
                        <li>HOME</li>
                        <li>SHOP</li>
                        <li>PORTIFOLIO</li>
                        <li>PAGE</li>
                        <li>BLOG</li>
                        <li>ELEMENTS</li>
                    </ul>
                </div>
                <div class="nav-part2">
                    <div class="nav-items2">
                        <ul class="login">
                            <li>LOG IN</li>
                            <li>SIGN UP</li>
                        </ul>
                        <span class="bag icob-shopping-bag">
                            <div class="items-number"><span>2</span></div>
                        </span>
                        <span class="search icob-search"></span>
                    </div>
                </div>
            </div>
        </div>
        <router-view/>
    </section>
</template>

<script>
export default {
    name: 'App'
};
</script>

<style src="@/assets/sass/main.sass" lang="sass">
</style>
