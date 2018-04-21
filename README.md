[![Build Status](https://travis-ci.org/Kalimaha/weather-station-manager.svg?branch=master)](https://travis-ci.org/Kalimaha/weather-station-manager)
[![Coverage Status](https://coveralls.io/repos/github/Kalimaha/weather-station-manager/badge.svg?branch=master)](https://coveralls.io/github/Kalimaha/weather-station-manager?branch=master)
[![Hosted By](https://img.shields.io/badge/hosted%20by-heroku-blue.svg)](https://weather-station-manager.herokuapp.com/api/updates/)

# Weather Station Manager
Phoenix-based web-app that receives and stores data from the home-made weather station.

## Development
This project uses Docker and Docker compose for development. To build the images, run:

```
docker-compose build
```

??? -> "mix deps.get"

The first time you will need to create the DB:

```
docker-compose run web mix ecto.create
docker-compose run web mix ecto.migrate
```

Then, to start the app:

```
docker-compose up web
```

You can now visit the homepage at http://localhost:4000.

## Tests
To run tests, execute:

```
docker-compose run test mix test
```
