defmodule Realworld.Resources.UserFollower do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "user_follower"
    repo Realworld.Repo
  end

  relationships do
    belongs_to :user, Realworld.Resources.User do
      primary_key? true
      allow_nil? false
    end

    belongs_to :follower, Realworld.Resources.User do
      primary_key? true
      allow_nil? false
    end
  end
end
