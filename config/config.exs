# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :realworld,
  ecto_repos: [Realworld.Repo]

config :realworld,
  ash_apis: [Realworld]

config :realworld, Realworld, resources: [registry: Realworld.Registry]

# Configures the endpoint
config :realworld, RealworldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "T0RscU9EbHhabXBtT0RscU16UTRhbVl5TTJobU9UbG1aakkwTlRsbU1tWTBOV3BxWkdkcUNnPT0K/234kw2Is2h",
  render_errors: [view: RealworldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Realworld.PubSub,
  live_view: [signing_salt: "I4QqCgpk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :realworld, Realworld.Guardian,
  issuer: "realworld",
  secret_key: "ODlqODlxZmpmODlqMzQ4amYyM2hmOTlmZjI0NTlmMmY0NWpqZGdqCg==",
  ttl: {3, :days}

config :realworld, RealworldWeb.AuthAccessPipeline,
  module: Realworld.Guardian,
  error_handler: RealworldWeb.AuthErrorHandler

config :realworld, Realworld.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
