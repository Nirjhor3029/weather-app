<template>
    <h1>Example Component</h1>
</template>

<script>
export default {

    data() {
        return {

        }
    },
    created() {
        console.log("Component created");
    },
    mounted() {
        console.log("Component mounted");
        this.fetchData();
    },

    methods: {
        
    }

}
</script>
<!-- <script setup>
</script> -->