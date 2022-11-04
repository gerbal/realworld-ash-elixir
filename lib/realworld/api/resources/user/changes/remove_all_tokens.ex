defmodule Realworld.Api.Resources.User.Changes.RemoveAllTokens do
  use Ash.Resource.Change
  require Ash.Query

  def remove_all_tokens, do: {__MODULE__, []}

  def change(changeset, _opts, _context) do
    Ash.Changeset.after_action(changeset, fn _changeset, user ->
      {:ok, query} =
        Realworld.Api.Resources.UserToken
        |> Ash.Query.filter(token.user_id == ^user.id)
        |> Ash.Query.data_layer_query()

      Realworld.Repo.delete_all(query)

      {:ok, user}
    end)
  end
end
