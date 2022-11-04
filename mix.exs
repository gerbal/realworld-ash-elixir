defmodule Realworld.MixProject do
  use Mix.Project

  def project do
    [
      app: :realworld,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {Realworld.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # ash
      {:ash, "~> 2.4"},
      {:ash_postgres, ">= 1.0.0"},
      {:ash_phoenix, ">= 1.0.0"},

      # GraphQL
      {:absinthe, "~> 1.5"},
      {:absinthe_plug, "~> 1.5"},

      # email
      {:bamboo, "~> 1.5"},
      {:premailex, "~> 0.3"},

      # auth
      {:bcrypt_elixir, "~> 3.0"},
      {:guardian, "~> 2.0"},

      # web
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, ">= 0.0.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:gettext, "~> 0.11"},

      # dev utils
      {:sobelow, "~> 0.8", only: :dev},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:elixir_sense, github: "elixir-lsp/elixir_sense", only: [:dev, :test]}
    ]
  end

  defp aliases do
    [
      setup: ["ash_postgres.create", "ash_postgres.migrate", "run priv/repo/seeds.exs"],
      reset: ["ash_postgres.drop", "ash_postgres.setup"]
    ]
  end
end
