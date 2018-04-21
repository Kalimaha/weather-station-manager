defmodule WeatherStationManager.Repo.Migrations.AddUpdatesTable do
  use Ecto.Migration

  def change do
    create table(:updates) do
      add :station,      :string
      add :lat,          :float
      add :lon,          :float
      add :temperature,  :float

      timestamps()
    end
  end
end
