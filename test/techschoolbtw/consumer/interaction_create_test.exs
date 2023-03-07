defmodule TechschoolbtwTest.Consumer.InteractionCreate do
  use ExUnit.Case, async: true

  import Mox
  import Techschoolbtw.Consumer.InteractionCreate

  doctest Techschoolbtw.Consumer.InteractionCreate

  describe "handle_event/1" do
    test "does not message when invoker is the not the bot owner" do
      interaction = %{
        channel_id: 1,
        user: %{id: 0},
        data: %{
          options: [
            %{value: "Test message"}
          ]
        }
      }

      DiscordAPIMock
      |> expect(:create_interaction_response, fn _interaction, _message -> {:ok, %{}} end)
      |> expect(:create_message, 0, fn _channel_id, _message -> {:ok, %{}} end)

      assert handle_event(interaction) == {:ok, %{}}
    end

    test "messages when invoker is the the bot owner" do
      interaction = %{
        channel_id: 1,
        user: %{id: Application.get_env(:techschoolbtw, :owner_id)},
        data: %{
          options: [
            %{value: "Test message"}
          ]
        }
      }

      DiscordAPIMock
      |> expect(:create_interaction_response, fn _interaction, _message -> {:ok, %{}} end)
      |> expect(:create_message, fn _channel_id, _message -> {:ok, %{}} end)

      assert handle_event(interaction) == {:ok, %{}}
    end
  end
end
