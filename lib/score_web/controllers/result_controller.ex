defmodule ScoreWeb.ResultController do
  use ScoreWeb, :controller

  alias Score.Ikan
  alias Score.Ikan.Result

  def index(conn, _params) do
    result = Ikan.list_result()
    render(conn, "index.html", result: result)
  end

  def new(conn, _params) do
    changeset = Ikan.change_result(%Result{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"result" => result_params}) do
    case Ikan.create_result(result_params) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Result created successfully.")
        |> redirect(to: result_path(conn, :show, result))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    result = Ikan.get_result!(id)
    render(conn, "show.html", result: result)
  end

  def edit(conn, %{"id" => id}) do
    result = Ikan.get_result!(id)
    changeset = Ikan.change_result(result)
    render(conn, "edit.html", result: result, changeset: changeset)
  end

  def update(conn, %{"id" => id, "result" => result_params}) do
    result = Ikan.get_result!(id)

    case Ikan.update_result(result, result_params) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Result updated successfully.")
        |> redirect(to: result_path(conn, :show, result))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", result: result, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    result = Ikan.get_result!(id)
    {:ok, _result} = Ikan.delete_result(result)

    conn
    |> put_flash(:info, "Result deleted successfully.")
    |> redirect(to: result_path(conn, :index))
  end
end
