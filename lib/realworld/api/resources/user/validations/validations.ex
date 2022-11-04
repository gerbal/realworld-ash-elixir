defmodule Realworld.Api.Resources.User.Validations do
  alias Realworld.Api.Resources.User.Validations

  def validate_current_password() do
    {Validations.ValidateCurrentPassword, []}
  end
end
