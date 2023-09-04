<template>
    <h1 style="margin-bottom: 1.875rem">Statistics</h1>

    <div class="row">
        <div class="offset-md-6 col-md-6">
            <div class="form-group">
                <!-- <label>Single select box using select 2</label> -->
                <select v-model="selectedCity" class="select2" style="width:100%">
                    <option v-for="(item, index) in cities" :key="index" :value="item.name">{{ item.name }}</option>
                </select>
            </div>
        </div>
    </div>
    <!-- Markup -->
    <div class="card">
        <div class="card-body">
            <div class="chart-header">
                <h4 class="card-title">Temperature (Last 24 Hours)</h4>
                <input type="date" class="date" name="date" id="" v-model="selectedDate" />
            </div>
            <canvas id="areaChart" style="height: 250px"></canvas>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="chart-header">
                <h4 class="card-title">Wind (Last 24 Hours)</h4>
                <input type="date" class="date" name="date" id="" v-model="windSelectedDate" />
            </div>
            <!-- <canvas id="areaChart" style="height: 250px"></canvas> -->

            <canvas id="windChart" aria-label="chart" style="height: 250px"></canvas>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="chart-header">
                <h4 class="card-title">Humidity (Last 24 Hours)</h4>
                <input type="date" class="date" name="date" id="" v-model="humiditySelectedDate" />
            </div>
            <!-- <canvas id="areaChart" style="height: 250px"></canvas> -->

            <canvas id="humidityChart" aria-label="chart" style="height: 250px"></canvas>
        </div>
    </div>
</template>

<script>
const baseUrl = window.location.origin;

export default {
    data() {
        return {
            selectedDate: this.setAllDateFields(),
            windSelectedDate: this.setAllDateFields(),
            humiditySelectedDate: this.setAllDateFields(),
            selectedCity: "Dubai",
            cities: [],
        };
    },
    watch: {
        selectedDate(newDate) {
            console.log("Date changed to:", newDate);
            this.fetchData(newDate, true);
        },
        windSelectedDate(newDate) {
            console.log("Date changed to:", newDate);
            this.fetchData(newDate, false, true);
        },
        humiditySelectedDate(newDate) {
            console.log("Date changed to:", newDate);
            this.fetchData(newDate, false, false, true);
        },
        selectedCity(newCity) {
            console.log("City changed to:", newCity);
            this.fetchData(this.selectedDate, true, true, true);
        },
    },
    mounted() {
        console.log("Component mounted");
        this.fetchData("today", true, true, true);
        this.getCities();
    },

    methods: {

        getCities() {
            fetch(baseUrl + "/api/get-cities")
                .then((response) => response.json())
                .then((data) => {
                    // console.log("cities data: ");
                    // console.log(data);
                    if (data.code == 200) {
                        if (data.data.length === 0) {
                            $(".no-data").show();
                        } else {
                            $(".no-data").hide();
                        }
                        // console.log(data);
                        this.cities = data.data;
                        this.fetchData();
                    }
                })
                .catch((error) => {
                    console.error("An error occurred:", error);
                });
        },

        fetchData(selectedDate, temp = false, wind = false, humidity = false) {
            let cityName = this.selectedCity;
            const apiUrl =
                baseUrl +
                "/api/get-hourly-data-by-city/" +
                cityName +
                "/" +
                selectedDate;
            fetch(apiUrl)
                .then((response) => response.json())
                .then((data) => {
                    if (data.status == 200) {
                        console.log(data);
                        const temperatures = [];
                        const winds = [];
                        const humidities = [];
                        const hour = [];

                        let jsonData = data;
                        jsonData.data.forEach((item) => {
                            // const temp = item.temperature;
                            temperatures.push(parseInt(item.temperature));
                            winds.push(parseInt(item.wind));
                            humidities.push(parseInt(item.humidity));
                            // Parse the timestamp string into a Date object
                            const timestamp = new Date(item.hour);
                            hour.push(timestamp.getHours());
                        });
                        console.table("Temperatures:", temperatures);
                        console.table("Winds:", winds);
                        console.table("Humidities:", humidities);

                        if (temp) {
                            var areaData = {
                                labels: hour,
                                datasets: [
                                    {
                                        label: "",
                                        data: temperatures,
                                        backgroundColor: [
                                            "rgba(255, 99, 132, 0.2)",
                                            "rgba(54, 162, 235, 0.2)",
                                            "rgba(255, 206, 86, 0.2)",
                                            "rgba(75, 192, 192, 0.2)",
                                            "rgba(153, 102, 255, 0.2)",
                                            "rgba(255, 159, 64, 0.2)",
                                        ],
                                        borderColor: [
                                            "rgba(255,99,132,1)",
                                            "rgba(54, 162, 235, 1)",
                                            "rgba(255, 206, 86, 1)",
                                            "rgba(75, 192, 192, 1)",
                                            "rgba(153, 102, 255, 1)",
                                            "rgba(255, 159, 64, 1)",
                                        ],
                                        borderWidth: 1,
                                        fill: true, // 3: no fill
                                    },
                                ],
                            };

                            var areaOptions = {
                                plugins: {
                                    filler: {
                                        propagate: true,
                                    },
                                },
                                scales: {
                                    yAxes: [
                                        {
                                            gridLines: {
                                                color: "rgba(204, 204, 204,0.1)",
                                            },
                                            ticks: {
                                                // Include a dollar sign in the ticks
                                                callback: function (
                                                    value,
                                                    index,
                                                    ticks
                                                ) {
                                                    return value + "° C";
                                                },
                                                beginAtZero: false,
                                                min: 10,
                                                stepSize: 10,
                                            },
                                        },
                                    ],
                                    xAxes: [
                                        {
                                            gridLines: {
                                                color: "rgba(204, 204, 204,0.1)",
                                            },
                                            ticks: {
                                                // Include a dollar sign in the ticks
                                                callback: function (
                                                    value,
                                                    index,
                                                    ticks
                                                ) {
                                                    return "0" + value;
                                                },
                                                beginAtZero: true,
                                                stepSize: 2,
                                            },
                                        },
                                    ],
                                },
                            };

                            var areaChartCanvas = $("#areaChart")
                                .get(0)
                                .getContext("2d");
                            var areaChart = new Chart(areaChartCanvas, {
                                type: "line",
                                data: areaData,
                                options: areaOptions,
                            });
                        }

                        if (wind) {
                            // Wind chart
                            var windChart = document
                                .getElementById("windChart")
                                .getContext("2d");
                            var chartId = new Chart(windChart, {
                                type: "line",
                                data: {
                                    labels: hour,
                                    datasets: [
                                        {
                                            label: "Wind",
                                            data: winds,
                                            backgroundColor: [
                                                "yellow",
                                                "aqua",
                                                "pink",
                                                "lightgreen",
                                                "lightblue",
                                                "gold",
                                            ],
                                            borderColor: ["black"],
                                            borderWidth: 2,
                                            pointRadius: 5,
                                        },
                                    ],
                                },
                                options: {
                                    responsive: true,
                                },
                            });
                        }


                        if (humidity) {
                            var humidityChart = document
                                .getElementById("humidityChart")
                                .getContext("2d");
                            var chartId = new Chart(humidityChart, {
                                type: "bar",
                                data: {
                                    labels: hour,
                                    datasets: [
                                        {
                                            label: "Humidity",
                                            data: humidities,
                                            backgroundColor: [
                                                "yellow",
                                                "aqua",
                                                "pink",
                                                "lightgreen",
                                                "lightblue",
                                                "gold",
                                            ],
                                            borderColor: ["black"],
                                            borderWidth: 2,
                                            pointRadius: 5,
                                        },
                                    ],
                                },
                                options: {
                                    responsive: true,
                                },
                            });
                        }
                    }
                })
                .catch((error) => {
                    console.error("An error occurred:", error);
                });
        },

        setAllDateFields() {
            const local = new Date();
            local.setMinutes(local.getMinutes() - local.getTimezoneOffset());
            let dateValue = local.toJSON().slice(0, 10);
            return dateValue;
            // $(".date").val(dateValue);
        },
    },
};
</script>
<!-- <script setup>
</script> -->
