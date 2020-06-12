defmodule DistWeb.Router do
  use DistWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DistWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DistWeb do
    pipe_through :browser
    
    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create, :edit]
    resources "/users/count", CountController, only: [:index, :show]
    resources "/sessions", SessionController, only: [:new, :create, :delete, :edit]
  end

  ## Other scopes may use custom stacks.
  scope "/api", DistWeb.Api, as: :api do
     pipe_through :api
     resources "/users", UserController, only: [:index, :show]
  end
end
