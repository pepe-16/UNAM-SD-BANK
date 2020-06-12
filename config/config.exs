# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dist,
  ecto_repos: [Dist.Repo]

# Configures the endpoint
config :dist, DistWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7x+BvEbhqrThGQxZQmsdd7CMRBPcLmXTXu/8ZCD/kwMNV62YE1HG36amKF66Qwy8",
  render_errors: [view: DistWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dist.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "g6K4UkwE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
