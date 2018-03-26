defmodule WeatherStationManager.Router do
  use WeatherStationManager.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeatherStationManager do
    pipe_through :browser     
    
    get "/", PageController, :index
  end

  scope "/api", WeatherStationManager do
    pipe_through :api

    post "/updates", UpdatesController, :create
  end
end
