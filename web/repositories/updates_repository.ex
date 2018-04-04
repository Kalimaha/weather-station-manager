defmodule WeatherStationManager.UpdatesRepository do
  alias WeatherStationManager.{ Repo, Update }

  def save(update) do
    Update.changeset(%Update{}, update)
    |> Repo.insert
  end
end
