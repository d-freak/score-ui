defmodule ScoreWeb.Router do
  use ScoreWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScoreWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/user", UserController
    resources "/score", ScoreController
    resources "/game", GameController
    resources "/result", ResultController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ScoreWeb do
  #   pipe_through :api
  # end
end
