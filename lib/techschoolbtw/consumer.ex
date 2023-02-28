defmodule Techschoolbtw.Consumer do
  use Nostrum.Consumer

  alias Techschoolbtw.Consumer.MessageCreate

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    MessageCreate.handle_event(msg)
  end

  def handle_event(_event) do
    :noop
  end
end
