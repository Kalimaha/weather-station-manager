[![Build Status](https://travis-ci.org/Kalimaha/weather-station-manager.svg?branch=master)](https://travis-ci.org/Kalimaha/weather-station-manager)
[![Coverage Status](https://coveralls.io/repos/github/Kalimaha/weather-station-manager/badge.svg?branch=master)](https://coveralls.io/github/Kalimaha/weather-station-manager?branch=master)

# Weather Station Manager
Phoenix-based web-app that receives and stores data from the home-made weather station.

## Development
This project uses Docker and Docker compose for development. To build the images, run:

```
docker-compose build
```

The first time you will need to create the DB:

```
docker-compose run web mix ecto.create
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
