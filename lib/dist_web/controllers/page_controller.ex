defmodule DistWeb.PageController do
  use DistWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
