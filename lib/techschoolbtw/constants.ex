defmodule Techschoolbtw.Constants do
  @moduledoc """
  Contains all the constants for the bot.
  This includes items such as links, or emoji IDs that will
  be used in multiple modules.
  """

  @doc """
  Link to the ever-famous "Say the line, IIT student!" video.
  """
  @spec tech_school_btw_link :: String.t()
  def tech_school_btw_link, do: "https://youtu.be/NCnY4fnD5hE"

  @spec tech_yeah_emoji :: String.t()
  def tech_yeah_emoji, do: "techyeah:983480064958165022"
end
