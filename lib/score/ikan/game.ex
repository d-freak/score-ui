defmodule Score.Ikan.Game do
  use Ecto.Schema
  import Ecto.Changeset


  schema "game" do
    field :result_id, :integer

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:result_id])
    |> validate_required([:result_id])
  end
end
