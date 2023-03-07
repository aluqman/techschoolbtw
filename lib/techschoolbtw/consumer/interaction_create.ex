defmodule Techschoolbtw.Consumer.InteractionCreate do
  @moduledoc """
  Module for handling interactions that come from the Discord API.

  Yes, this looks like shit right now. No, I'm not going to let it stay
  this way. Tech debt baybeeeeeeeeeeeeeeeeeeeeee
  """

  # TODO: yep, also make this less shit.

  import Bitwise
  alias Techschoolbtw.API

  @failure_response %{
    # Respond w/ message type
    type: 4,
    data: %{
      content: "You are not in the sudoers file. This incident will be reported.",
      flags: 1 <<< 6
    }
  }

  @success_response %{
    # Respond w/ message type
    type: 4,
    data: %{
      content: "Done!",
      flags: 1 <<< 6
    }
  }
  @doc """
  Handler for handling interaction event creation from the API.
  """
  @spec handle_event(Nostrum.Struct.Interaction.t()) :: {:ok, struct()} | {:error, struct()}
  def handle_event(msg) do
    channel = msg.channel_id
    user = msg.user
    value = List.first(msg.data.options).value

    if user.id != Application.get_env(:techschoolbtw, :owner_id, 0) do
      API.create_interaction_response(msg, @failure_response)
    else
      API.create_message(channel, value)
      API.create_interaction_response(msg, @success_response)
    end
  end
end
