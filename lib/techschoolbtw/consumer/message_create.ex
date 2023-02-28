defmodule Techschoolbtw.Consumer.MessageCreate do
  @moduledoc """
  Handler module for :MESSAGE_CREATE events recieved by the consumer.
  """
  alias Nostrum.Api
  alias Techschoolbtw.Constants

  @doc """
  Handles the event for receiving messages. Most of the time, this
  involves analyzing the content of the message and responding in some way.
  This can be extended to harass a specific discord user by responding against
  a specific author id, if one chooses
  """
  def handle_event(msg) do
    unless msg.author.bot do
      content = String.downcase(msg.content)
      cond do
        content =~ "tech school btw" ->
          Api.create_message(msg.channel_id, Constants.tech_school_btw_link)

        true ->
          :ignore
      end
    end
  end
end