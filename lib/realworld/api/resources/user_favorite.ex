defmodule Realworld.Api.Resources.UserFavorite do
  use Ash.Resource
    # data_layer: your_data_layer

  attributes do
    uuid_primary_key :id
  end

  relationships do
    belongs_to :user, Realworld.Api.Resources.User do
      source_attribute :username
      destination_attribute :username
      allow_nil? false
    end

    belongs_to :artice, Realworld.Api.Resources.Article do
      source_attribute :slug
      destination_attribute :slug
      allow_nil? false
    end
  end
end
