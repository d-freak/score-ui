defmodule Score.Ikan.Score do
  use Ecto.Schema
  import Ecto.Changeset


  schema "score" do
    field :game_id, :integer
    field :user_id, :integer
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(score, attrs) do
    score
    |> cast(attrs, [:user_id, :game_id, :value])
    |> validate_required([:user_id, :game_id, :value])
  end
end
