defmodule WeatherStationManager.UpdatesControllerTest do
  use WeatherStationManager.ConnCase

  test "POST /updates", %{conn: conn} do
    conn = post conn, "/api/updates"

    assert json_response(conn, 201) == %{ "status" => "ok" }
  end
end
