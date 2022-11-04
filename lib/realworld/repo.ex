defmodule Realworld.Repo do
  use AshPostgres.Repo,
    otp_app: :realworld

  def installed_extensions() do
    ["uuid-ossp", "pg_trgm", "citext"]
  end
end
