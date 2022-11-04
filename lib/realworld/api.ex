defmodule Realworld.Api do
  use Ash.Api, otp_app: :realworld

  resources do
    # This defines the set of resources that can be used with this API
    registry Realworld.Api.Registry
  end
end