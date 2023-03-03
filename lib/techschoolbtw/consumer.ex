defmodule Techschoolbtw.Consumer do
  @moduledoc """
  Over-arching consumer for events from the Discord API.
  Utilizes Nostrum.Consumer to consume events.
  """
  use Nostrum.Consumer

  alias Techschoolbtw.Consumer.MessageCreate

  @doc """
  Starts the consumer.
  """
  @spec start_link :: {:error, String.t()} | {:ok, pid()}
  def start_link do
    Consumer.start_link(__MODULE__)
  end

  @doc """
  Handles events as published by the Discord API to the Nostrum Consumer.
  Ships events off to be handled by a separate handler
  function depending on the event.
  """
  @impl Nostrum.Consumer
  @spec handle_event(Nostrum.Consumer.event()) :: :noop | {:ok, struct()} | {:error, struct()}
  def handle_event({event, msg, _ws_state}) do
    case event do
      :MESSAGE_CREATE -> MessageCreate.handle_event(msg)
      _ -> :noop
    end
  end
end
