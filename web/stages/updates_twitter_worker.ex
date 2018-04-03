defmodule UpdatesTwitterWorker do
  use GenStage

  require Logger

  def start_link() do
    GenStage.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    { :consumer, :ok, subscribe_to: [ UpdatesManager ] }
  end

  def handle_events(events, _from, state) do
    Logger.debug "[STAGE] - Tweet about it: START"
    Enum.each events, fn(_spam) -> Logger.debug "processing tweet..." end
    Logger.debug "[STAGE] - Tweet about it: DONE"

    { :noreply, [], state }
  end
end
