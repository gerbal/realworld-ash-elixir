defmodule Realworld.Resources.UserToken do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    notifiers: [Realworld.Resources.EmailNotifier]

  alias Realworld.Resources.UserToken.Changes, warn: false
  alias Realworld.Resources.Preparations, warn: false

  postgres do
    table "user_tokens"
    repo Realworld.Repo
  end

  identities do
    identity :token_context, [:context, :token]
  end

  actions do
    defaults [:read]

    read :verify_email_token do
      argument :token, :url_encoded_binary, allow_nil?: false
      argument :context, :string, allow_nil?: false
      prepare Preparations.SetHashedToken
      prepare Preparations.DetermineDaysForToken

      filter expr(
               token == ^context(:hashed_token) and context == ^arg(:context) and
                 created_at > ago(^context(:days_for_token), :day)
             )
    end

    create :build_session_token do
      primary? true

      argument :user, :map

      change manage_relationship(:user, type: :append_and_remove)
      change set_attribute(:context, "session")
      change Changes.BuildSessionToken
    end

    create :build_email_token do
      accept [:sent_to, :context]

      argument :user, :map

      change manage_relationship(:user, type: :append_and_remove)
      change Changes.BuildHashedToken
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :token, :binary
    attribute :context, :string
    attribute :sent_to, :string

    create_timestamp :created_at
  end

  relationships do
    belongs_to :user, Realworld.Resources.User
  end
end
