<template>
    <div class="row">


        <div v-for="(item, index) in items" :key="index" class="col-xl-2 col-md-3 col-sm-4 grid-margin stretch-card">
            <div class="card">
                <div class="card-body weather_container">
                    <div class="address">
                        <div class="city_name">{{ item.name }}</div>
                        <div class="country_name">{{ item.country }}</div>
                    </div>

                    <!-- <img class="weather_icon" :src="weatherIcon" alt=""> -->
                    <img class="weather_icon" :src="item.iconUrl" alt="">

                    <div class="temp_container">
                        <span class="temp_number">{{ item.temp_cel }}</span>
                        <span class="temp_symbol">°</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { ref } from 'vue';

const iconDir = "../../../assets/project_images/";

const weatherIcon = ref(iconDir + "clear.svg");
const baseUrl = window.location.origin;


export default {
    data() {
        return {
            weatherIcon,
            items: [],
            cities: []
        }
    },

    mounted() {
        console.log("Component mounted");
        this.getCities();

        setInterval(() => {
            this.fetchData();
        }, 60000);
    },

    methods: {
        getCities() {
            fetch(baseUrl + "/api/get-cities")
                .then(response => response.json())
                .then(data => {
                    if (data.code == 200) {
                        console.log(data);
                        this.cities = data.data;
                        this.fetchData();
                    }
                })
                .catch(error => {
                    console.error("An error occurred:", error);
                });
        },

        fetchData() {
            this.items = [];
            let api_key = "4c7f1f68689243332f5672f3f5d973e0";
            // console.log("fdfds");
            this.cities.forEach(city => {
                fetch("https://api.openweathermap.org/data/2.5/weather?lat=" + city.lat + "&lon=" + city.lon + "&appid=" + api_key)
                    .then(response => response.json())
                    .then(data => {
                        // console.log(data);
                        if (data.cod == 200) {
                            // console.log(data.weather[0].icon);

                            let temp_cel = parseFloat(data.main.temp) - 273.15;
                            let feels_like_cel = parseFloat(data.main.feels_like) - 273.15;

                            const conversionFactor = 3.6; // 1 m/s = 3.6 km/h
                            let windSpeedMetersPerSecond = parseFloat(data.wind.speed);
                            // Calculate kilometers per hour
                            let windSpeedkilometersPerHour = windSpeedMetersPerSecond * conversionFactor;
                            let icon_svg = "";
                            let temp_desc = data.weather[0].description;
                            
                            if (temp_desc == "clear sky") {
                                icon_svg = "clear.svg";
                            } else if (temp_desc == "few clouds") {
                                icon_svg = "cloudy_rainny.svg";
                            } else if (temp_desc == "scattered clouds") {
                                icon_svg = "cloudy.svg";
                            } else if (temp_desc == "broken clouds") {
                                icon_svg = "cloudy.svg";
                            } else if (temp_desc == "shower rain") {
                                icon_svg = "rain.svg";
                            } else if (temp_desc == "rain") {
                                icon_svg = "rain.svg";
                            } else if (temp_desc == "thunderstorm") {
                                icon_svg = null;
                            } else if (temp_desc == "snow") {
                                icon_svg = null;
                            } else if (temp_desc == "mist") {
                                icon_svg = null;
                            } else {
                                icon_svg = null;
                            }

                            let iconUrl = "";

                            if(icon_svg == null){
                                iconUrl = "https://openweathermap.org/img/wn/"+data.weather[0].icon+"@2x.png";
                            }else{
                                iconUrl = ref(iconDir + icon_svg);
                            }

                            let cityData = {
                                city_id: city.id,
                                name: city.name,
                                country: city.country,

                                weather_condition: data.weather[0].main,
                                weather_description: data.weather[0].description,
                                weather_icon: data.weather[0].icon,
                                temp_cel: temp_cel.toFixed(),
                                feels_like_cel: feels_like_cel.toFixed(),
                                pressure: data.main.pressure,
                                humidity: data.main.humidity,
                                temp_min: data.main.temp_min,
                                temp_max: data.main.temp_max,
                                wind_speed_km: windSpeedkilometersPerHour.toFixed(),
                                wind_speed_deg: data.wind.deg,
                                iconUrl: iconUrl,
                            };
                            this.items.push(cityData);
                        }
                    })
                    .catch(error => {
                        console.error("An error occurred:", error);
                    });
            });
            console.log(this.items);
        }
        // fetchData() {
        //     let api_key = "4c7f1f68689243332f5672f3f5d973e0";
        //     console.log("fdfds");
        //     this.cities.forEach(city => {
        //         fetch("https://api.openweathermap.org/data/2.5/weather?q=" + city.name + "&appid=" + api_key)
        //             .then(response => response.json())
        //             .then(data => {
        //                 if (data.cod == 200) {
        //                     console.log(data);
        //                     let temp_cel = parseFloat(data.main.temp) - 273.15;
        //                     let feels_like_cel = parseFloat(data.main.temp) - 273.15;
        //                     let cityData = {
        //                         city_id: city.id,
        //                         name: city.name,
        //                         country: city.country,
        //                         weather_description: data.weather.description,
        //                         weather_icon: data.weather.icon,
        //                         temp_cel: temp_cel.toFixed(),
        //                         feels_like_cel: feels_like_cel.toFixed(),
        //                         pressure: data.weather.icon,
        //                         humidity: data.weather.icon,
        //                         wind_speed_km: data.weather.icon,
        //                         wind_speed_deg: data.weather.icon,
        //                         temp_min: data.weather.icon,
        //                         temp_max: data.weather.icon
        //                     };
        //                     this.items.push(cityData);
        //                 }
        //             })
        //             .catch(error => {
        //                 console.error("An error occurred:", error);
        //             });
        //     })
        // }
    }
}



// export default {

//     data() {
//         return {

//         }
//     },
//     created() {
//         console.log("Component created");
//     },
//     mounted() {
//         console.log("Component mounted");
//         this.fetchData();
//     },

//     methods: {
//         fetchData() {
//             let api_key = "4c7f1f68689243332f5672f3f5d973e0";
//             let city = "Abu Dhabi";
//             fetch("https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + api_key)
//                 .then(response => response.json())
//                 .then(data => {
//                     // console.log(data.cod)
//                     if (data.cod == 200) {
//                         console.log(data)
//                         // console.log(data.coord.lat);
//                         // console.log(data.coord.lon);
//                     }
//                 })
//                 .catch(error => {
//                     console.error("An error occurred:", error);
//                 });
//             // fetch("https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}")
//             //     .then(response => response.json())
//             //     .then(data => {
//             //         console.log(data);
//             //     })
//         }
//     }

// }
</script>