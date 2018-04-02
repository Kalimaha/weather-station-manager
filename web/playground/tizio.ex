defmodule Tizio do
  require Logger

  defmodule Source do
    use GenStage

    def start_link() do
      GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
    end

    def init(:ok) do
      { :producer, :ok, dispatcher: GenStage.BroadcastDispatcher }
    end

    def handle_demand(_demand, state) do
      { :noreply, [], state }
    end

    def broadcast_update(update) do
      GenStage.call(__MODULE__, { :broadcast, update })
    end

    def handle_call({ :broadcast, update }, _from, state) do
      { :reply, %{:ok=>"Weather update received."}, [ update ], state }
    end
  end

  defmodule DBManager do
    use GenStage

    def start_link() do
      GenStage.start_link(__MODULE__, :ok)
    end

    def init(:ok) do
      { :consumer, :ok, subscribe_to: [ Tizio.Source ] }
    end

    def handle_events(events, _from, state) do
      Logger.debug "[STAGE] - Write to DB: START"
      Enum.each events, fn(_spam) -> Logger.debug "processing SQL..." end
      Logger.debug "[STAGE] - Write to DB: DONE"

      { :noreply, [], state }
    end
  end

  defmodule TwitterManager do
    use GenStage

    def start_link() do
      GenStage.start_link(__MODULE__, :ok)
    end

    def init(:ok) do
      { :consumer, :ok, subscribe_to: [ Tizio.Source ] }
    end

    def handle_events(events, _from, state) do
      Logger.debug "[STAGE] - Tweet about it: START"
      Enum.each events, fn(_spam) -> Logger.debug "processing tweet..." end
      Logger.debug "[STAGE] - Tweet about it: DONE"

      { :noreply, [], state }
    end
  end
end
