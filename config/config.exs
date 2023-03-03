import Config

config :nostrum,
  token: "#{System.get_env("TEST_BOT_TOKEN", "")}",
  gateway_intents: :all

if File.exists?("config/secrets.exs"), do: import_config("secrets.exs")
