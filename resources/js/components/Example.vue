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
        fetchData() {
            let api_key = "4c7f1f68689243332f5672f3f5d973e0";
            let city = "Abu Dhabi";
            fetch("https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + api_key)
                .then(response => response.json())
                .then(data => {
                    // console.log(data.cod)
                    if (data.cod == 200) {
                        console.log(data)
                        // console.log(data.coord.lat);
                        // console.log(data.coord.lon);
                    }
                })
                .catch(error => {
                    console.error("An error occurred:", error);
                });
            // fetch("https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}")
            //     .then(response => response.json())
            //     .then(data => {
            //         console.log(data);
            //     })
        }
    }

}
</script>
<!-- <script setup>
</script> -->