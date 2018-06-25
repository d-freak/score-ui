defmodule Score.Repo.Migrations.CreateResult do
  use Ecto.Migration

  def change do
    create table(:result) do
      add :date, :naive_datetime
      add :memo, :string

      timestamps()
    end

  end
end
