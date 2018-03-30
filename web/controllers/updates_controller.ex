defmodule WeatherStationManager.UpdatesController do
  use WeatherStationManager.Web, :controller

  def create(conn, _params) do
    conn
    |> put_status(201)
    |> json(%{ status: "OK" })
  end
end

