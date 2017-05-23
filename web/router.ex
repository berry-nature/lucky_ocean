defmodule Ap.Router do
  use Ap.Web, :router
  use Coherence.Router  

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session 
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
    plug :put_layout, {Ap.LayoutView, :admin}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  scope "/admin" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", Ap do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/admin", as: :admin do
    pipe_through :protected

    get "/", Ap.Admin.ArticleController, :index

    resources "/articles", Ap.Admin.ArticleController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Ap do
  #   pipe_through :api
  # end
end
