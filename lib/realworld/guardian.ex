defmodule Realworld.Guardian do
  use Guardian, otp_app: :realword

  alias Realworld.Resources.User

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Realworld.get!(User, id)

    {:ok, resource}
  end
end
