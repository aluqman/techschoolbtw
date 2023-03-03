defmodule TechschoolbtwTest.Consumer.Ready do
  use ExUnit.Case, async: true

  import Mox

  alias Techschoolbtw.Consumer.Ready

  doctest Techschoolbtw.Consumer.Ready

  setup :verify_on_exit!

  describe "handle_ready/0" do
    test "ready sets status when API is connected" do
      DiscordAPIMock
      |> expect(:update_status, fn _status, _text, _type -> :ok end)

      assert Ready.handle_ready() == :ok
    end

    test "ready returns error if API is unavailable" do
      error = {:error, %{error: "some error"}}

      DiscordAPIMock
      |> expect(:update_status, fn _status, _text, _type -> error end)

      assert Ready.handle_ready() == error
    end
  end
end
