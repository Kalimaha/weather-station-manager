defmodule WeatherStationManager.UpdatesController do
  use WeatherStationManager.Web, :controller

  def create(conn, params) do
    Tizio.Source.broadcast_update(params)

    conn
    |> put_status(201)
    |> json(%{ status: "OK" })
  end
end

