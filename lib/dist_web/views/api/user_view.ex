defmodule DistWeb.Api.UserView do
	use DistWeb, :view 

	def render("index.json", %{users: users}) do
		%{data: render_many(users, DistWeb.Api.UserView, "user.json")}
	end

	def render("user.json", %{user: user}) do
		%{
			name: user.name,
			username: user.username,
			propietario: user.owner,
			password_hash: user.password_hash
		}
	end

	def render("show.json", %{users: users}) do
		%{data: render_many(users, DistWeb.Api.UserView, "user.json")}
	end
end