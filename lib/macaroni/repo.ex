defmodule Macaroni.Repo do
  use Ecto.Repo,
    otp_app: :macaroni,
    adapter: Ecto.Adapters.Postgres
end
