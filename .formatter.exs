# Used by "mix format"
[
  import_deps: [:ecto, :phoenix, :ash, :ash_postgres],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"],
  plugins: [Spark.Formatter]
]
