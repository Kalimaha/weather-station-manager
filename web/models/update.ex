defmodule WeatherStationManager.Update do
  use WeatherStationManager.Web, :model

  schema "updates" do
    field :station,      :string
    field :lat,          :float
    field :lon,          :float
    field :temperature,  :float

    timestamps
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:station, :lat, :lon, :temperature])
  end
end

