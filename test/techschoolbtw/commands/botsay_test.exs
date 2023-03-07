defmodule TechschoolbtwTest.Commands.Botsay do
  use ExUnit.Case, async: true

  import Techschoolbtw.Commands.Botsay

  doctest Techschoolbtw.Commands.Botsay

  describe "command/0" do
    test "properly returns a command map" do
      assert is_map(command())
    end
  end
end
