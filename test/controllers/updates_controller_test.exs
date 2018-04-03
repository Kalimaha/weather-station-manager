defmodule WeatherStationManager.UpdatesControllerTest do
  use WeatherStationManager.ConnCase, async: false

  import Mock

  @temperature  %{ "temperature" => 42.0 }
  @update       %{ "data" => @temperature }

  test "POST /updates", %{conn: conn} do
    conn = post conn, "/api/updates", @update

    assert json_response(conn, 201) == %{ "status" => "OK" }
  end

  test "the update is broadcasted to the workers", %{conn: conn} do
    with_mock UpdatesManager, [broadcast_update: fn(_spam) -> :eggs end] do
      post conn, "/api/updates", @update

      assert called UpdatesManager.broadcast_update(@update)
    end
  end
end
