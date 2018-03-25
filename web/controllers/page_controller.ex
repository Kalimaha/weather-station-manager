defmodule WeatherStationManager.PageController do
  use WeatherStationManager.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
