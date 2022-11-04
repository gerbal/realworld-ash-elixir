defmodule Realworld.Resources.User.Validations do
  alias Realworld.Resources.User.Validations

  def validate_current_password() do
    {Validations.ValidateCurrentPassword, []}
  end
end
