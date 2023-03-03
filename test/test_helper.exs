Mox.defmock(DiscordAPIMock, for: Techschoolbtw.API)
Application.put_env(:techschoolbtw, :api, DiscordAPIMock)

ExUnit.start()
