<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index() {
        return view('weather_report');
    }

    public function cities()
    {
        return view('cities');
    }
}
