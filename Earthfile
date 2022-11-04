VERSION 0.6

check:
  BUILD +check-formatting
  BUILD +test

deps:
  FROM elixir:1.14.1 # debian bullseye
  WORKDIR /app
  COPY mix.exs .
  COPY mix.lock .
  COPY config ./config 
  RUN mix local.rebar --force 
  RUN mix local.hex --force
  RUN mix deps.get

code:
  FROM +deps
  COPY lib ./lib
  COPY priv ./priv

compile:
  FROM +code 
  ARG ENV=dev
  ENV MIX_ENV=$ENV
  RUN mix deps.compile
  RUN mix compile
  SAVE IMAGE --cache-hint

check-formatting:
  FROM +compile --ENV=test
  COPY .formatter.exs .
  RUN mix format --check-formatted

test-setup:
  FROM +compile --ENV=test
  RUN apt update && apt install -y jq postgresql-client
  # Installs Docker Engine for Docker-in-Docker with caching enabled
  DO github.com/earthly/lib+INSTALL_DIND
  SAVE IMAGE --cache-hint

test:
  FROM +test-setup
  COPY docker-compose.deps.yml ./ 
  COPY test ./test
  WITH DOCKER --compose docker-compose.deps.yml --service postgres
    RUN while ! pg_isready --host=localhost --port=5432 --username=postgres; do sleep 1; done ; \
    POSTGRES_HOST=localhost mix test
  END

build:
  FROM +compile --ENV=prod
  RUN mix release
  SAVE ARTIFACT _build/prod AS LOCAL _build/prod

push:
  FROM debian:11-slim
  WORKDIR /app
  ARG --required REGISTRY
  ARG --required TAG  
  ENV LANG=C.UTF-8
  ENV LC_ALL C.UTF-8
  COPY +build/prod/rel/realworld .
  CMD ["/app/bin/realworld", "start"]
  SAVE IMAGE --push $REGISTRY/backend:$TAG