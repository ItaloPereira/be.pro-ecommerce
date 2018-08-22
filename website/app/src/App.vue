<template>
    <article id="app">
        <Nav/>
        <router-view/>
    </article>
</template>

<script>
import Nav from './components/nav';

export default {
    name: 'App',
    components: {
        Nav
    }
};
</script>

<style src="@/assets/sass/main.sass" lang="sass">
</style>
