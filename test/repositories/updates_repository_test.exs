defmodule WeatherStationManager.UpdatesRepositoryTest do
  use WeatherStationManager.ModelCase

  alias WeatherStationManager.{ Repo, Update, UpdatesRepository }

  @update %{ 
    :lat => 42.0,
    :lon => 23.0,
    :spam => "eggs",
    :temperature => 100.0,
    :station => "South Yarra"
  }

  test "save new content in the DB" do
    UpdatesRepository.save(@update)

    assert (length Repo.all Update) == 1
  end

  test "assigns an ID to the record" do
    { :ok, record } = UpdatesRepository.save(@update)

    refute record.id == nil
  end
end
