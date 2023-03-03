defmodule Techschoolbtw.Consumer do
  @moduledoc """
  Over-arching consumer for events from the Discord API.
  Utilizes Nostrum.Consumer to consume events.
  """
  require Logger

  use Nostrum.Consumer

  alias Techschoolbtw.Consumer.MessageCreate
  alias Techschoolbtw.Consumer.Ready

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
  @spec handle_event(Nostrum.Consumer.event()) :: :noop | :ok
  def handle_event({event, msg, _ws_state}) do
    response =
      case event do
        :MESSAGE_CREATE -> MessageCreate.handle_event(msg)
        :READY -> Ready.handle_ready()
        _ -> :noop
      end

    case response do
      ok when ok in [:ok, {:ok}] -> :ok
      {:ok, _} -> :ok
      {:error, e} -> Logger.error(e)
      _ -> :noop
    end
  end
end
