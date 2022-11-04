defmodule Realworld.Api.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry Realworld.Api.Resources.User
    entry Realworld.Api.Resources.UserToken
    entry Realworld.Api.Resources.UserFavorite
    entry Realworld.Api.Resources.Article
    entry Realworld.Api.Resources.ArticleTag
    entry Realworld.Api.Resources.Tag
    entry Realworld.Api.Resources.Comment
  end
end
