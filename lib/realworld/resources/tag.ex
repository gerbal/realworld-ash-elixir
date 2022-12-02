defmodule Realworld.Resources.Tag do
  use Ash.Resource, data_layer: AshPostgres.DataLayer, extensions: [AshJsonApi.Resource]

  postgres do
    table "tags"
    repo Realworld.Repo
  end

  actions do
    # Add a set of simple actions. You'll customize these later.
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    attribute :id, :string do
      primary_key? true
      allow_nil? false
    end
  end

  json_api do
    type "tag"

    routes do
      base "/tags"

      index :read
    end
  end
end
