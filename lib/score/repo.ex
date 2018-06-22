defmodule Score.Repo do
  use Ecto.Repo, otp_app: :score, adapter: Sqlite.Ecto2
end
