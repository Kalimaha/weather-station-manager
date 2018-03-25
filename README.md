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
docker-compose up
```

You can now visit the homepage at http://localhost:4000.
