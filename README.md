# Realworld

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


### Todo

 - model basic resources in ASH-Postgres
 - expose jsonapis with ash-jsonapi
 - expose expected apis directly

#### Routes to Implement

- [ ] POST /api/users/login
- [ ] POST /api/users
- [ ] GET /api/user
- [ ] PUT /api/user
- [ ] GET /api/profiles/:username
- [ ] POST /api/profiles/:username/follow
- [ ] DELETE /api/profiles/:username/follow
- [ ] GET /api/articles
- [ ] GET /api/articles/feed
- [ ] GET /api/articles/:slug
- [ ] POST /api/articles
- [ ] PUT /api/articles/:slug
- [ ] DELETE /api/articles/:slug
- [ ] POST /api/articles/:slug/comments
- [ ] GET /api/articles/:slug/comments
- [ ] DELETE /api/articles/:slug/comments/:id
- [ ] POST /api/articles/:slug/favorite
- [ ] DELETE /api/articles/:slug/favorite
- [ ] GET /api/tags
