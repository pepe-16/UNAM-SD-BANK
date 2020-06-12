defmodule DistWeb.CountController do
   use DistWeb, :controller

   alias Dist.Accounts
   alias Dist.Accounts.User

   def index(conn, %{"owner" => owner}) do
      counts = Accounts.get_user(owner)
      render(conn, "counts.html", counts: counts)
   end
end