<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WeatherReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'city_id',
        'weather_condition',
        'weather_description',
        'weather_icon',
        'temp_cel',
        'feels_like_cel',
        'pressure',
        'humidity',
        'wind_speed_km',
        'wind_speed_deg',
        'temp_min',
        'temp_max',
        'created_at',
        'updated_at',
    ];
}
