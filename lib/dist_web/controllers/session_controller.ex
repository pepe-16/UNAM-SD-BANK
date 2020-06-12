defmodule DistWeb.SessionController do
  use DistWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(
    conn,
    %{"session" => %{"username" => username, "password" => pass}}
  ) do
    case Dist.Accounts.authenticate_by_username_and_pass(username, pass) do
      {:ok, user} ->
        conn
          |> DistWeb.Auth.login(user)
          |> put_flash(:info, "Qué bueno tenerte de regreso!!")
          |> redirect(to: Routes.page_path(conn, :index))
        
      {:error, _reason} ->
        conn
          |> put_flash(:error, "Nombre de usuario o Contraseña inválidos")
          |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> DistWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end

end

