defmodule RealworldWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :realword

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
