import Config

config :nostrum,
  token: "nope",
  gateway_intents: []

if File.exists?("config/secrets.exs"), do: import_config("secrets.exs")

if File.exists?("#{Mix.env()}.exs"), do: import_config("#{Mix.env()}.exs")
