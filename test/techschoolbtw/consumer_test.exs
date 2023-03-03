defmodule TechschoolbtwTest.Consumer do
  use ExUnit.Case, async: true

  import Mox
  import Techschoolbtw.Consumer

  doctest Techschoolbtw.Consumer

  setup :verify_on_exit!

  describe "handle_event/1" do
    test "no-ops on unrecognized event" do
      assert handle_event({:UNRECOGNIZED, "message", %{}}) == :noop
    end 

    test "properly hands off :MESSAGE_CREATE" do
      message = %{author: %{bot: false}, content: "tech school btw", channel_id: 1}

      DiscordAPIMock
      |> expect(:create_message, fn _id, _content -> {:ok, %{}} end)

      assert handle_event({:MESSAGE_CREATE, message, %{}}) == :ok
    end

    test "properly hands off :READY" do 
      DiscordAPIMock
      |> expect(:update_status, fn _status, _text, _type -> :ok end)

      assert handle_event({:READY, %{}, %{}}) == :ok
    end
    
    test "logs error when one occurs" do 
      DiscordAPIMock
      |> expect(:update_status, fn _status, _text, _type -> {:error, %{}} end)
      
      assert handle_event({:READY, %{}, %{}}) == :ok
    end 
  end
end
