import vue from '@vitejs/plugin-vue';
import laravel from 'laravel-vite-plugin';
import { defineConfig } from 'vite';

// Import the plugin for SCSS
import vitePluginSass from 'vite-plugin-sass';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
        vue(),
        // Use the SCSS plugin
        vitePluginSass({
            // your SCSS options here
        }),
    ],
    css: {
        preprocessorOptions: {
            scss: {
                // Import your main SCSS file
                additionalData: `@import './assets/scss/styles.scss';`
            }
        }
    },
    resolve: {
        alias: {
            vue: "vue/dist/vue.esm-bundler.js",
        }
    }
});
