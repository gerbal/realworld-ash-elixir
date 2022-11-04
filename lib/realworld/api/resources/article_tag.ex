defmodule Realworld.Api.Resources.ArticleTag do
  use Ash.Resource
    # data_layer: your_data_layer

  attributes do
    uuid_primary_key :id
  end

  relationships do
    belongs_to :tag, Realworld.Api.Resources.Tag do
      destination_attribute :id
      source_attribute :tag_id
      allow_nil? false
    end

    belongs_to :artice, Realworld.Api.Resources.Article do
      source_attribute :slug
      destination_attribute :slug
      allow_nil? false
    end
  end
end
