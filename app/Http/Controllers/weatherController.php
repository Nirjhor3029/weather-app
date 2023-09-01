<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\WeatherReport;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class WeatherController extends Controller
{
    public function storeWeather(Request $request)
    {
        WeatherReport::create($request->all());
        return response()->json([
            'code' => 200,
            'status' => 'success'
        ], 200);
    }

    public function fetchWeatherAPI()
    {
        $cities = City::all();
        $api_key = '4c7f1f68689243332f5672f3f5d973e0';

        $allData = [];

        foreach ($cities as $key => $city) {
            $response = Http::get("https://api.openweathermap.org/data/2.5/weather?lat=$city->lat&lon=$city->lon&appid=$api_key");

            if ($response->ok()) {
                $weatherData = $response->json();
                // dd($weatherData['weather']);
                $temp_cel = (int)ceil($weatherData['main']['temp'] - 273.15);
                $feels_like_cel = (int)ceil($weatherData['main']['feels_like'] - 273.15);

                // dd($temp_cel,$feels_like_cel);
                $conversionFactor = 3.6; // 1 m/s = 3.6 km/h
                $windSpeedMetersPerSecond = $weatherData['wind']['speed'];
                $windSpeedkilometersPerHour = round(($windSpeedMetersPerSecond * $conversionFactor), 2);

                $currentTime = Carbon::now();

                $icon_svg = "";
                $temp_desc = $weatherData['weather'][0]['description'];

                if ($temp_desc == "clear sky") {
                    $icon_svg = "clear.svg";
                } elseif ($temp_desc == "few clouds") {
                    $icon_svg = "cloudy_rainny.svg";
                } elseif ($temp_desc == "scattered clouds") {
                    $icon_svg = "cloudy.svg";
                } elseif ($temp_desc == "broken clouds") {
                    $icon_svg = "cloudy.svg";
                } elseif ($temp_desc == "shower rain") {
                    $icon_svg = "rain.svg";
                } elseif ($temp_desc == "rain") {
                    $icon_svg = "rain.svg";
                } elseif ($temp_desc == "thunderstorm") {
                    $icon_svg = null;
                } elseif ($temp_desc == "snow") {
                    $icon_svg = null;
                } elseif ($temp_desc == "mist") {
                    $icon_svg = null;
                } else {
                    $icon_svg = null;
                }

                $singleData = [
                    "city_id" => $city->id,
                    "weather_condition" => $weatherData['weather'][0]['main'],
                    "weather_description" => $weatherData['weather'][0]['description'],
                    "weather_icon" => $weatherData['weather'][0]['icon'],
                    "weather_icon_svg" => $icon_svg,
                    "temp_cel" => $temp_cel,
                    "feels_like_cel" => $feels_like_cel,
                    "pressure" => $weatherData['main']['pressure'],
                    "humidity" => $weatherData['main']['humidity'],
                    "temp_min" => $weatherData['main']['temp_min'],
                    "temp_max" => $weatherData['main']['temp_max'],
                    "wind_speed_km" => $windSpeedkilometersPerHour,
                    "wind_speed_deg" => $weatherData['wind']['deg'],
                    "created_at" => $currentTime,
                    "updated_at" => $currentTime,
                ];
                $allData[] = $singleData;
            } else {
                // Handle the API request error here.
                // return view('error');
                continue;
            }
        }

        WeatherReport::insert($allData);

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'data' => $allData
        ], 200);

        return response()->json([
            'code' => 200,
            'status' => 'success'
        ], 200);
    }
}
