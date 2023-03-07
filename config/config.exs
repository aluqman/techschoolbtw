import Config

config :nostrum,
  token: "#{System.get_env("TEST_BOT_TOKEN", "")}",
  gateway_intents: :all

config :techschoolbtw,
  owner_id: System.get_env("OWNER_ID")

if File.exists?("config/secrets.exs"), do: import_config("secrets.exs")
