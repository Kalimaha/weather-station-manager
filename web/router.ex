defmodule WeatherStationManager.Router do
  use WeatherStationManager.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WeatherStationManager do
    pipe_through :api
  end
end
