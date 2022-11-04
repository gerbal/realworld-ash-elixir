defmodule Realworld.Api.Resources.Tag do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "tags"
    repo(Realworld.Repo)
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
end
