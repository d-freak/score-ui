defmodule ScoreWeb.ScoreController do
  use ScoreWeb, :controller

  alias Score.Ikan
  alias Score.Ikan.Score

  def index(conn, _params) do
    score = Ikan.list_score()
    render(conn, "index.html", score: score)
  end

  def new(conn, _params) do
    changeset = Ikan.change_score(%Score{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"score" => score_params}) do
    case Ikan.create_score(score_params) do
      {:ok, score} ->
        conn
        |> put_flash(:info, "Score created successfully.")
        |> redirect(to: score_path(conn, :show, score))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    score = Ikan.get_score!(id)
    render(conn, "show.html", score: score)
  end

  def edit(conn, %{"id" => id}) do
    score = Ikan.get_score!(id)
    changeset = Ikan.change_score(score)
    render(conn, "edit.html", score: score, changeset: changeset)
  end

  def update(conn, %{"id" => id, "score" => score_params}) do
    score = Ikan.get_score!(id)

    case Ikan.update_score(score, score_params) do
      {:ok, score} ->
        conn
        |> put_flash(:info, "Score updated successfully.")
        |> redirect(to: score_path(conn, :show, score))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", score: score, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    score = Ikan.get_score!(id)
    {:ok, _score} = Ikan.delete_score(score)

    conn
    |> put_flash(:info, "Score deleted successfully.")
    |> redirect(to: score_path(conn, :index))
  end
end
