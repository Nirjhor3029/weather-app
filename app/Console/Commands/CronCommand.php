<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use PhpParser\Node\Stmt\TryCatch;

class CronCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:cron-command';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        Log::build([
            'driver' => 'single',
            'path' => storage_path('logs/custom-log.log'),
        ])->info("data: ");

        // Make an HTTP GET request to your route
        $url = url('/api/fetch-weather-api');
        Log::build([
            'driver' => 'single',
            'path' => storage_path('logs/custom-log.log'),
        ])->info($url);

        try {
            $response = Http::get($url);

            Log::build([
                'driver' => 'single',
                'path' => storage_path('logs/custom-log.log'),
            ])->info($response->body());
        } catch (\Throwable $th) {
            Log::build([
                'driver' => 'single',
                'path' => storage_path('logs/custom-log.log'),
            ])->info($th);
        }


        // Handle the response as needed
        // Example: Log the response or perform some action based on the response
        // You can access the response body using $response->body()
        // $response->status() gives you the HTTP status code
    }
}
