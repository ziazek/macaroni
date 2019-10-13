# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :macaroni,
  ecto_repos: [Macaroni.Repo]

# Configures the endpoint
config :macaroni, MacaroniWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jq4srBVk/JvnHDS6Yth4opI520IUVgzMD2AaFBrG3pkKLYy1QYFn6xf12846iSA2",
  render_errors: [view: MacaroniWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Macaroni.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
