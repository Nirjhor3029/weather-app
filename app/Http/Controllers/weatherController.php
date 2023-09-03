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
        $api_key = env('API_KEY');

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

    public function getHourlyData()
    {

        $date = null;

        $cities = City::all();

        $allCitiesHourlyData = [];

        foreach ($cities as $key => $city) {
            $allCitiesHourlyData[$city->name] = [
                'city_name' => $city->name,
                'data' => $this->getSingleLocationDataHourly($city->id, $date)
            ];
        }

        dd($allCitiesHourlyData);
    }

    public function getHourlyDataByCity($city_name, $date = null)
    {

        $city = City::where('name', $city_name)->first();
        if (!isset($city)) {
            return response()->json([
                'status' => 404,
                'message' => "City not found"
            ], 404);
        }

        $data = $this->getSingleLocationDataHourly($city->id, $date);
        return response()->json([
            'status' => 200,
            'data' => $data
        ], 200);
    }

    public function getSingleLocationDataHourly($cityId, $date)
    {
        if ($date == null) {
            $now = Carbon::now();
        }

        $startOfDay = $now->format('Y-m-d 00:00:00');
        $endOfDay = $now->format('Y-m-d 23:59:59');
        $carbonDate = Carbon::createFromFormat('Y-m-d H:i:s', $startOfDay);

        // Extract the day
        // $day = $carbonDate->format('l');
        // return $day;

        // Retrieve temperature data from the database ordered by timestamp
        $temperatureData = WeatherReport::where('city_id', $cityId)
            ->whereBetween('created_at', [$startOfDay, $endOfDay])
            ->orderBy('created_at')->get();

        // Initialize an array to store hourly temperature differences
        $hourlyTemperatures = [];

        // Initialize variables to keep track of the current hour and the closest data point to the start of the hour
        $currentHour = null;
        $closestDataPoint = null;

        foreach ($temperatureData as $data) {
            $created_at = $data->created_at;
            $temperature = $data->temp_cel;

            if (!$currentHour) {
                $currentHour = $created_at->format('Y-m-d H:00:00');
                $closestDataPoint = $data;
            }

            if ($created_at->format('Y-m-d H:00:00') === $currentHour) {
                // Update the closest data point if it's closer to the start of the hour
                if (abs($created_at->diffInSeconds($currentHour)) < abs($closestDataPoint->created_at->diffInSeconds($currentHour))) {
                    $closestDataPoint = $data;
                }
            } else {
                // Store the closest data point for the current hour
                $hourlyTemperatures[] = [
                    'hour' => $currentHour,
                    'temperature' => $closestDataPoint->temp_cel,
                    'wind' => $closestDataPoint->temp_cel,
                    'humidity' => $closestDataPoint->humidity,
                ];

                // Reset variables for the next hour
                $currentHour = $created_at->format('Y-m-d H:00:00');
                $closestDataPoint = $data;
            }
        }

        // Now $hourlyTemperatures contains data for every hour
        // dd($hourlyTemperatures);
        return $hourlyTemperatures;
    }
}
