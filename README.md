### Setting up the environment

1.  clone the git
2.  composer update --no-scripts
3.  cp .env.example .env
4.  php artisan key:generate
5.  Create db and change the credential inside the .env file[DB name, Username, password]
5.a.  Add **API_KEY={Your_API_KEY}** .env file
5.b.  **Must change APP_URL**
6.  php artisan migrate
8.  NPM setup
8.a.  npm install
8.a.  npm run dev/ npm run build
9. `php artisan schedule:work` : for fetch weather data in every 10 minutes


*** Statistics part will show the chart after fetching data atleast 1 hour. As we are showing hourly report.
