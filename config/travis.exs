use Mix.Config

config :weather_station_manager, WeatherStationManager.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :weather_station_manager, WeatherStationManager.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "weather_station_manager_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
