defmodule Realworld.Api.Resources.Comment do
  use Ash.Resource

  actions do
    # defaults [:create, :read, :update, :destroy]
  end

  attributes do
    integer_primary_key :id

    attribute :body, :string do
      allow_nil? false
    end

    attribute :author_username, :string do
      allow_nil? false
    end

    create_timestamp :createdAt
    update_timestamp :updatedAt
  end

  relationships do
    has_one :author, Realworld.Api.Resources.User do
      source_attribute :author_username
      destination_attribute :username
    end

    belongs_to :article, Realworld.Api.Resources.Article
  end
end
