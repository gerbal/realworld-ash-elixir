defmodule Realworld do
  use Ash.Api, otp_app: :realworld, extensions: [AshJsonApi.Api]

  resources do
    # This defines the set of resources that can be used with this API
    registry Realworld.Registry
  end

  json_api do
    router(Realworld.Router)
    prefix "/json_api"
    serve_schema?(true)
    log_errors?(true)
    # ...
  end
end
