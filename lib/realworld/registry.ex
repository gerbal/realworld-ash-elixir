defmodule Realworld.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry Realworld.Resources.User
    entry Realworld.Resources.UserToken
    entry Realworld.Resources.UserFavorite
    entry Realworld.Resources.Article
    entry Realworld.Resources.ArticleTag
    entry Realworld.Resources.Tag
    entry Realworld.Resources.Comment
  end
end
