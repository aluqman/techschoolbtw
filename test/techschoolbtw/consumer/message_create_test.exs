defmodule TechschoolbtwTest.Consumer.MessageCreate do
  use ExUnit.Case, async: true

  import Mox
  import Techschoolbtw.Consumer.MessageCreate

  doctest Techschoolbtw.Consumer.MessageCreate

  setup :verify_on_exit!

  @techschoolbtw "tech school btw"
  @techyeah "tech yeah"

  describe "handle_event/1" do
    test "ignores bot messages" do
      message = %{author: %{bot: true}, content: "This is a message."}

      assert handle_event(message) == :noop
    end

    test "creates a reaction when prompted" do
      message = %{author: %{bot: false}, content: @techyeah, channel_id: 1, id: 1}

      DiscordAPIMock
      |> expect(:create_reaction, fn _channel_id, _message_id, _emoji -> {:ok} end)

      assert handle_event(message) == {:ok}
    end

    test "returns an error if API is unavailable" do
      message = %{author: %{bot: false}, content: @techschoolbtw, channel_id: 1}

      DiscordAPIMock
      |> expect(:create_message, fn _channel_id, _emoji -> {:error, %{}} end)

      assert handle_event(message) == {:error, %{}}
    end

    test "no-op if no conditions are met" do
      message = %{author: %{bot: false}, content: "This is a message."}

      assert handle_event(message) == :noop
    end
  end
end
