defmodule Techschoolbtw.API do
  @moduledoc """
  Module for interacting with the discord API.

  This leverages Nostrum.Api under normal circumstances and acts as 
  a simple wrapper, however this is necessary for utilizing Mox in testing.
  Acts as a behavior whereas Nostrum.Api does not.

  For all documentation, see https://kraigie.github.io/nostrum/Nostrum.Api.html
  """

  @callback create_message(integer(), Nostrum.Struct.Message.t()) ::
              {:ok, Nostrum.Struct.Message.t()} | {:error, struct()}

  @callback create_reaction(integer(), integer(), String.t()) ::
              {:ok} | {:error, struct()}

  @callback update_status(atom(), String.t(), integer()) :: :ok

  @doc false
  def create_reaction(channel_id, message_id, emoji) do
    impl().create_reaction(channel_id, message_id, emoji)
  end

  @doc false
  def create_message(channel_id, message) do
    impl().create_message(channel_id, message)
  end

  @doc false
  def update_status(status, text, type) do
    impl().update_status(status, text, type)
  end

  defp impl, do: Application.get_env(:techschoolbtw, :api, Nostrum.Api)
end
