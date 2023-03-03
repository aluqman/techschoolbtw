import Config

config :nostrum,
  token: "nope",
  gateway_intents: []

import_config "#{Mix.env()}.exs"

if File.exists?("config/secrets.exs"), do: import_config("secrets.exs")
