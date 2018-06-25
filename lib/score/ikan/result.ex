defmodule Score.Ikan.Result do
  use Ecto.Schema
  import Ecto.Changeset


  schema "result" do
    field :date, :naive_datetime
    field :memo, :string

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:date, :memo])
    |> validate_required([:date, :memo])
  end
end
