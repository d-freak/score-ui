# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :score, Score.Repo,
  adapter: Sqlite.Ecto2,
  database: "score.db",
  username: "d-freak",
  password: "",
  hostname: "localhost"


# General application configuration
config :score,
  ecto_repos: [Score.Repo]

# Configures the endpoint
config :score, ScoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+DcCIQjsoU5Lsnzbe31EiKG57Q80JkhvkhHzlISCJPH9dtLPtd0RGGUd8ivkwTA6",
  render_errors: [view: ScoreWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Score.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
