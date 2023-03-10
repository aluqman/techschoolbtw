defmodule Techschoolbtw.Consumer.MessageCreate do
  @moduledoc """
  Handler module for :MESSAGE_CREATE events recieved by the consumer.
  """
  require Logger
  alias Techschoolbtw.API
  alias Techschoolbtw.Constants

  @doc """
  Handles the event for receiving messages. Most of the time, this
  involves analyzing the content of the message and responding in some way.
  This can be extended to harass a specific discord user by responding against
  a specific author id, if one chooses
  """
  @spec handle_event(Nostrum.Struct.Message.t()) ::
          {:ok, Nostrum.Struct.Message.t()} | {:error, any()} | :ignore
  def handle_event(msg) do
    content = msg.content

    cond do
      msg.author.bot ->
        :noop

      content =~ "tech school btw" ->
        API.create_message(
          msg.channel_id,
          content: Constants.tech_school_btw_link()
        )

      content =~ "tech yeah" ->
        API.create_reaction(
          msg.channel_id,
          msg.id,
          Constants.tech_yeah_emoji()
        )

      true ->
        :noop
    end
  end
end
