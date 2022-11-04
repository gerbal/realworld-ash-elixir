defmodule Realworld.Api.Resources.User.Preparations.ValidatePassword do
  use Ash.Resource.Preparation

  def prepare(query, _opts, _) do
    Ash.Query.after_action(query, fn
      query, [result] ->
        password = Ash.Query.get_argument(query, :password)

        if Realworld.Api.Resources.User.Helpers.valid_password?(result, password) do
          {:ok, [result]}
        else
          {:ok, []}
        end

      _, _ ->
        {:ok, []}
    end)
  end
end
