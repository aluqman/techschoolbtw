defmodule Techschoolbtw.Commands.Botsay do
  @moduledoc """
  Has the information for creating a command to say something from the 
  point of view of the bot. By default, this is designed to only be usable
  by the owner of the bot, because that's the only thing that makes this 
  make any sense.
  """

  # TODO: Find a way to make this work less shittily.
  # While you're at it, try to figure out how to make the
  # components interface less shit.

  @command_name "sudo"
  @command_description "This is a secret. Shh."
  @command_options [
    %{
      name: "what",
      description: "What to say.",
      # String-type command option
      type: 3,
      required: true
    }
  ]

  @doc """
  Handles the creation of the Botsay command. 
  """
  @spec command :: Nostrum.Struct.ApplicationCommand.t()
  def command do
    %{
      name: @command_name,
      description: @command_description,
      options: @command_options
    }
  end
end
