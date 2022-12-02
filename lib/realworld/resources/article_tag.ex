defmodule Realworld.Resources.ArticleTag do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "article_tags"
    repo Realworld.Repo
  end

  relationships do
    belongs_to :tag, Realworld.Resources.Tag,
      attribute_type: :string,
      primary_key?: true,
      allow_nil?: false

    belongs_to :article, Realworld.Resources.Article do
      primary_key? true
      allow_nil? false
    end
  end
end
