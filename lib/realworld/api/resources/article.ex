defmodule Realworld.Api.Resources.Article do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "articles"
    repo(Realworld.Repo)
  end

  identities do
    identity :unique_slug, [:slug]
  end

  actions do
    # Add a set of simple actions. You'll customize these later.
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id

    attribute :slug, :ci_string,
      allow_nil?: false,
      writable?: false

    attribute :title, :string do
      allow_nil? true
    end

    attribute :description, :string do
      allow_nil? true
    end

    attribute :body, :string do
      allow_nil? true
    end

    attribute :author_id, :uuid do
      allow_nil? true
    end

    attribute :favorited, :boolean do
      generated? true
    end

    create_timestamp :createdAt
    update_timestamp :updatedAt
  end

  # aggregates do
  #   count :favoritesCount, :favorited_by do
  #     # TODO?
  #     # filter expr(published == true)
  #   end
  # end

  # calculations do
  #   # TODO?
  #   calculate :favorited, :boolean, # expr(first_name <> " " <> last_name)
  # end

  relationships do
    has_one :author, Realworld.Api.Resources.User

    many_to_many :favoritedBy, Realworld.Api.Resources.User do
      through Realworld.Api.Resources.UserFavorite

      destination_attribute_on_join_resource :user_id
      source_attribute_on_join_resource :article_id
    end

    many_to_many :tagList, Realworld.Api.Resources.Tag do
      through Realworld.Api.Resources.ArticleTag

      destination_attribute_on_join_resource :tag_id
      source_attribute_on_join_resource :article_id
    end
  end
end
