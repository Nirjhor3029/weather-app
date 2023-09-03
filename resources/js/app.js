import './bootstrap';

// import { createApp } from 'vue/dist/vue.esm-bundler.js';
import { createApp } from 'vue';
import Cities from "./components/Cities.vue";
import Example from "./components/Example.vue";
import Statistics from "./components/Statistics.vue";
import Weather from "./components/Weather.vue";
const app = createApp({
    components:{
        Example,
        Weather,
        Cities,
        Statistics,
    }
})
app.mount("#app")

