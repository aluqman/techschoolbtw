import Config

config :nostrum,
  token: System.get_env("TEST_BOT_TOKEN", ""),
  gateway_intents: :all
