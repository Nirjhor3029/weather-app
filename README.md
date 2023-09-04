### Setting up the environment

1.  clone the git <br> 
2.  composer update --no-scripts <br>
3.  cp .env.example .env <br>
4.  php artisan key:generate <br>
5.  Create db and change the credential inside the .env file[DB name, Username, password] <br>
5.a.  Add **API_KEY={Your_API_KEY}** .env file <br>
5.b.  **Must change APP_URL** <br>
6.  php artisan migrate <br>
8.  NPM setup <br>
8.a.  npm install <br>
8.a.  npm run dev/ npm run build <br>
9. `php artisan schedule:work` : for fetch weather data in every 10 minutes <br>


*** Statistics part will show the chart after fetching data atleast 1 hour. As we are showing hourly report.
