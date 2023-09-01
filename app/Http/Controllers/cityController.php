<?php

namespace App\Http\Controllers;

use App\Models\City;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function getCities() 
    {
        $cities = City::all();
        return response()->json([
            'code' => 200,
            'data' => $cities
        ]);
    }
}
