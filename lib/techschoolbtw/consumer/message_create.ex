defmodule Techschoolbtw.Consumer.MessageCreate do
  alias Nostrum.Api
  alias Techschoolbtw.Constants

  def handle_event(msg) do
    unless msg.author.bot do
      cond do
        msg.content =~ "tech school btw" ->
          Api.create_message(msg.channel_id, Constants.tech_school_btw_link)

        true ->
          :ignore
      end
    end
  end
end
