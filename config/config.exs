# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
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
  render_errors: [view: RealworldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Realworld.PubSub,
  live_view: [signing_salt: "/i37b2yy"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :realworld, Realworld.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

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
import_config "#{config_env()}.exs"
