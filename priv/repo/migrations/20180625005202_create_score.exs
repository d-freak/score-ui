defmodule Score.Repo.Migrations.CreateScore do
  use Ecto.Migration

  def change do
    create table(:score) do
      add :user_id, :integer
      add :game_id, :integer
      add :value, :integer

      timestamps()
    end

  end
end
