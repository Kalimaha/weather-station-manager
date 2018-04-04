defmodule UpdatesDBConsumer do
  use GenStage

  require Logger

  def start_link() do
    GenStage.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    { :consumer, :ok, subscribe_to: [ UpdatesProducer ] }
  end

  def handle_events(events, _from, state) do
    Logger.debug "[STAGE] - Write to DB: START"
    Enum.each events, fn(_spam) -> Logger.debug "processing SQL..." end
    Logger.debug "[STAGE] - Write to DB: DONE"

    { :noreply, [], state }
  end
end
