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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ash, "~> 2.4"},
      {:ash_postgres, ">= 1.0.0"},
      {:ash_phoenix, ">= 1.0.0"},
      {:bcrypt_elixir, "~> 3.0"},
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
