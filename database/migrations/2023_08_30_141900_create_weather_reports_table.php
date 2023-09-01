<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('weather_reports', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('city_id');
            $table->foreign('city_id')->references('id')->on('cities')->onDelete('cascade');

            $table->string("weather_condition")->nullable();
            $table->string("weather_description")->nullable();
            $table->string("weather_icon")->nullable();
            $table->string("weather_icon_svg")->nullable();

            $table->string("temp_cel")->nullable();
            $table->string("feels_like_cel")->nullable();
            $table->string("pressure")->nullable();
            $table->string("humidity")->nullable();

            $table->string("wind_speed_km")->nullable();
            $table->string("wind_speed_deg")->nullable();

            $table->string("temp_min")->nullable();
            $table->string("temp_max")->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('weather_reports');
    }
};
