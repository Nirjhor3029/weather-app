<template>
    <div class="container p5">

        <button type="button" class="btn btn-primary mb-4 float-right" data-toggle="modal" data-target="#addCityModal">
            Add New
        </button>
        <div class="modal" id="addCityModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title text-muted">Add New City</h5>
                        <button type="button" class="close close_modal" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">

                        <div class="text-sm text-danger" if="errors != ''">
                            <p v-for="error in errors" class="mb-0 text-capitalize font-bold" :key="error"><small>{{ error
                            }} </small></p>
                        </div>

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" v-model="form.name">
                        </div>
                        <button type="button" class="btn btn-primary" @click="fetchData">Submit</button>
                        <!-- <button type="button" class="btn btn-primary" @click="updateCity">Update</button> -->

                    </div>
                </div>
            </div>
        </div>

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Lat</th>
                    <th>Lon</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="city in cities" :key="city.id">
                    <td>{{ city.name }}</td>
                    <td>{{ city.lat }}</td>
                    <td>{{ city.lon }}</td>
                    <td>
                        <a href="javascript:void(0)" class="text-danger" @click="deleteData(city.id)">
                            <i class="mdi mdi-delete" style="font-size: 21px;"></i>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import axios from 'axios';
import { reactive } from 'vue';

const baseUrl = window.location.origin;
export default {

    data() {
        const form = reactive({
            name: '',
            lat: '',
            lon: '',
            country: ''
        });
        return {
            items: [],
            cities: [],
            errors: [],
            form
        }
    },
    mounted() {
        this.getCities();
    },

    methods: {
        getCities() {
            fetch(baseUrl + "/api/get-cities")
                .then(response => response.json())
                .then(data => {
                    if (data.code == 200) {
                        console.log(data);
                        this.cities = data.data;
                    }
                })
                .catch(error => {
                    console.error("An error occurred:", error);
                });
        },

        async storeCity() {
            try {
                console.log("storeCity");
                console.log(this.form);
                await axios.post(baseUrl + "/api/add-city", this.form);
                this.getCities();
                this.formReset();
                $("#addCityModal").modal('hide');

            } catch (e) {
                console.log(e.response.data.errors);
                if (e.response.status == 422) {
                    var data = [];
                    for (const key in e.response.data.errors) {
                        data.push(e.response.data.errors[key][0]);
                    }
                    console.log(data);
                    this.errors = data;
                }
            }
        },

        async deleteData(cityId) {
            try {
                await axios.post(baseUrl + "/api/remove-city/" + cityId, []);
                this.getCities();
                this.formReset();
            } catch (e) {
                console.log(e.response.data.errors);
            }
        },

        fetchData() {
            let api_key = "4c7f1f68689243332f5672f3f5d973e0";
            fetch("https://api.openweathermap.org/data/2.5/weather?q=" + this.form.name + "&appid=" + api_key)
                .then(response => response.json())
                .then(data => {
                    console.log(data)
                    if (data.cod == 200) {
                        this.form.lat = data.coord.lat;
                        this.form.lon = data.coord.lon;
                        this.form.country = data.sys.country;

                        this.storeCity();
                    } else {
                        this.errors.push(data.message);
                    }
                })
                .catch(error => {
                    console.error("An error occurred:", error);
                });
        },

        formReset() {
            this.form.name = "";
            this.form.lat = "";
            this.form.lon = "";
            this.form.country = "";

            this.errors = [];
        }
    },
}

</script>