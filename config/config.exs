# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :weather_station_manager,
  ecto_repos: [WeatherStationManager.Repo]

# Configures the endpoint
config :weather_station_manager, WeatherStationManager.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5r0DUF/H8sUbSFZGO0xOMAU+iRRVQdhge6EYDxaGf5Yyavo2/ggltrYkUtRrhpUy",
  render_errors: [view: WeatherStationManager.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WeatherStationManager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
