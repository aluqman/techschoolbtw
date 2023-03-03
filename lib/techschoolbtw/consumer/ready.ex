defmodule Techschoolbtw.Consumer.Ready do
  @moduledoc """
  Holds the responsibilities of reacting to the :READY gateway event.
  This includes setting the bot's status, as well as what it's doing
  i.e. streaming, watching, playing, etc.
  """
  alias Techschoolbtw.API

  @status :online
  @playing_text "the slow, bitter end of the world."
  @watching_type 3

  @doc """
  Handles the event for :READY.
  """
  @spec handle_ready :: :ok | {:error, struct()}
  def handle_ready do
    API.update_status(
      @status,
      @playing_text,
      @watching_type
    )
  end
end
