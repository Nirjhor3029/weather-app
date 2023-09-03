<?php

use App\Http\Controllers\CityController;
use App\Http\Controllers\PageController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/welcome', function () {
    return view('welcome');
});

Route::get('/',[PageController::class,'index'])->name('weaterReport');
Route::get('/cities',[PageController::class,'cities'])->name('cities');
Route::get('/app', function () {
    return $_SERVER['HTTP_REFERER'];
    // return url('/api/fetch-weather-api');
    return view('app');
});


