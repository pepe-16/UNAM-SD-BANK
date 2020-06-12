defmodule Dist.Repo do
  use Ecto.Repo,
    otp_app: :dist,
    adapter: Ecto.Adapters.Postgres
end
