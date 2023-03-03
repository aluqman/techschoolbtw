defmodule TechschoolbtwTest.Constants do
  use ExUnit.Case                                      
  alias Techschoolbtw.Constants

  doctest Techschoolbtw.Constants

  assert is_binary(Constants.tech_school_btw_link())
end
