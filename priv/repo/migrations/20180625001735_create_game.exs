defmodule Score.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:game) do
      add :result_id, :integer

      timestamps()
    end

  end
end
