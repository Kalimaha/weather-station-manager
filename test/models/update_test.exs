defmodule WeatherStationManager.UpdateTest do
  use WeatherStationManager.ModelCase

  alias WeatherStationManager.Update

  @invalid_attributes %{ :spam => "eggs" }
  @valid_attributes %{
    :station => "South Yarra",
    :lat => 42.0,
    :lon => 23.0,
    :temperature => 100
  }

  test "changeset with valid attributes" do
    changeset = Update.changeset(%Update{}, @valid_attributes)

    assert changeset.valid?
  end
end

