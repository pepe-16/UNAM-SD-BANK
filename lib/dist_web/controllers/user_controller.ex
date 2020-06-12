defmodule DistWeb.UserController do
   use DistWeb, :controller
   import Ecto.Query
   alias Dist.Repo

   alias Dist.Accounts
   alias Dist.Accounts.User
   plug :authenticate when action in [:index, :show]

   def index(conn, _params) do
      users = Accounts.list_users()
      users
      #|> Phoenix.json_library().encode()
      #render(conn, "index.html", users: users)
      render(conn, "index.html", users: users)
   end

   # def show(conn, %{"id" => id}) do
   #    user = Accounts.get_user(id)
   #    render(conn, "show.html", user: user)
   #    #json(conn, %{id: id})
   # end

   def show(conn, %{"id" => id}) do
      user = Accounts.get_user(id)
      q=from m in User, where: m.owner == ^user.owner
      cuentas = Repo.all(q)
      render(conn, "show.html", users: cuentas)
      #json(conn, %{id: id})
   end

   def new(conn, _params) do
      changeset = Accounts.change_registration(%User{}, %{})
      render(conn, "new.html", changeset: changeset)
   end

   def create(conn, %{"user" => user_params}) do
      case Accounts.register_user(user_params) do
      
      {:ok, user} ->
         conn
         |> DistWeb.Auth.login(user)
         |> put_flash(:info, "#{user.name} creado!")
         |> redirect(to: Routes.user_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
         render(conn, "new.html", changeset: changeset)
      end
   end

   defp authenticate(conn, _opts) do
      if conn.assigns.current_user do
         conn
      else
         conn
         |> put_flash(:error, "Debes autentificarte para acceder a la página!!")
         |> redirect(to: Routes.page_path(conn, :index))
         |> halt()
      end
   end
end
