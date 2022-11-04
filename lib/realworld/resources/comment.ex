defmodule Realworld.Resources.Comment do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "comments"
    repo(Realworld.Repo)
  end

  actions do
    # defaults [:create, :read, :update, :destroy]
  end

  attributes do
    integer_primary_key :id

    attribute :body, :string do
      allow_nil? false
    end

    attribute :author_id, :uuid do
      allow_nil? false
    end

    create_timestamp :createdAt
    update_timestamp :updatedAt
  end

  relationships do
    has_one :author, Realworld.Resources.User

    belongs_to :article, Realworld.Resources.Article
  end
end
