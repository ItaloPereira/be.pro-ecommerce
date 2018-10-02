<template>
    <article id="app">
        <Nav/>
        <router-view/>
    </article>
</template>

<script>
import Nav from './components/nav';
import { EventBus } from './utils/event-bus';

export default {
    name: 'app',
    components: {
        Nav
    },
    mounted() {
        EventBus.$emit('app-mounted');
    }
};
</script>

<style src="@/assets/sass/main.sass" lang="sass">
</style>
