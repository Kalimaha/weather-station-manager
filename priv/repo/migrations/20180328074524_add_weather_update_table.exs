defmodule WeatherStationManager.Repo.Migrations.AddWeatherUpdateTable do
  use Ecto.Migration

  def change do
    create table("weather_update") do
      add :station,      :string
      add :lat,          :float
      add :lon,          :float
      add :temperature,  :float

      timestamps()
    end
  end
end
