defmodule DistWeb.Api.UserController do
	use DistWeb, :controller

	alias Dist.Accounts
	alias Dist.Accounts.User
	import Ecto.Query
	alias Dist.Repo

	def index(conn, _params) do
		users = Accounts.list_users()
		render(conn, "index.json", users: users)
	end


   def show(conn, %{"id" => id}) do
      user = Accounts.get_user(id)
      q=from m in Accounts.User, where: m.owner == ^user.owner
      cuentas = Repo.all(q)
      render(conn, "show.json", users: cuentas)
   end
end