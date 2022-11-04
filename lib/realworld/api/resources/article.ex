defmodule Realworld.Api.Resources.Article do
  use Ash.Resource

  actions do
    # Add a set of simple actions. You'll customize these later.
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    attribute :slug, :string do
      primary_key? true
      allow_nil? false
    end

    attribute :title, :string do
      allow_nil? true
    end

    attribute :description, :string do
      allow_nil? true
    end

    attribute :body, :string do
      allow_nil? true
    end

    attribute :author_username, :string do
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
    has_one :author, Realworld.Api.Resources.User do
      source_attribute :author_username
      destination_attribute :username
    end

    many_to_many :favoritedBy, Realworld.Api.Resources.User do
      through Realworld.Api.Resources.UserFavorite

      destination_attribute :username
      destination_attribute_on_join_resource :username
      source_attribute :slug
      source_attribute_on_join_resource :slug
    end

    many_to_many :tagList, Realworld.Api.Resources.Tag do
      through Realworld.Api.Resources.ArticleTag

      destination_attribute :id
      destination_attribute_on_join_resource :tag_id

      source_attribute :slug
      source_attribute_on_join_resource :slug
    end
  end
end
