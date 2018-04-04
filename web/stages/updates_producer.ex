defmodule UpdatesProducer do
  use GenStage

  require Logger

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
    { :reply, %{ :ok => "Weather update received." }, [ update ], state }
  end
end
