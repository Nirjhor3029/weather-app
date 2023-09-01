import './bootstrap';

// import { createApp } from 'vue/dist/vue.esm-bundler.js';
import { createApp } from 'vue';
import Example from "./components/Example.vue";
import Weather from "./components/Weather.vue";
const app = createApp({
    components:{
        Example,
        Weather,
    }
})
app.mount("#app")

