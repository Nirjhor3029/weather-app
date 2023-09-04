<?php

use App\Http\Controllers\CityController;
use App\Http\Controllers\WeatherController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/get-cities',[CityController::class,'getCities'])->name('getCities');
Route::post('/add-city',[CityController::class,'storeCity'])->name('storeCity');
Route::post('/remove-city/{cityId}',[CityController::class,'removeCity'])->name('removeCity');

Route::post('/add-weather-report',[WeatherController::class,'storeWeather'])->name('storeWeather');
Route::get('/fetch-weather-api',[WeatherController::class,'fetchWeatherAPI'])->name('fetchWeatherAPI');

// From Database
Route::get('/get-hourly-data',[WeatherController::class,'getHourlyData'])->name('getHourlyData');
Route::get('/get-hourly-data-by-city/{city_name}/{selectedDate}',[WeatherController::class,'getHourlyDataByCity'])->name('getHourlyData');
