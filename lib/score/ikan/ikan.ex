defmodule Score.Ikan do
  @moduledoc """
  The Ikan context.
  """

  import Ecto.Query, warn: false
  alias Score.Repo

  alias Score.Ikan.User

  @doc """
  Returns the list of user.

  ## Examples

      iex> list_user()
      [%User{}, ...]

  """
  def list_user do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Score.Ikan.Result

  @doc """
  Returns the list of result.

  ## Examples

      iex> list_result()
      [%Result{}, ...]

  """
  def list_result do
    Repo.all(Result)
  end

  @doc """
  Gets a single result.

  Raises `Ecto.NoResultsError` if the Result does not exist.

  ## Examples

      iex> get_result!(123)
      %Result{}

      iex> get_result!(456)
      ** (Ecto.NoResultsError)

  """
  def get_result!(id), do: Repo.get!(Result, id)

  @doc """
  Creates a result.

  ## Examples

      iex> create_result(%{field: value})
      {:ok, %Result{}}

      iex> create_result(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_result(attrs \\ %{}) do
    %Result{}
    |> Result.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a result.

  ## Examples

      iex> update_result(result, %{field: new_value})
      {:ok, %Result{}}

      iex> update_result(result, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_result(%Result{} = result, attrs) do
    result
    |> Result.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Result.

  ## Examples

      iex> delete_result(result)
      {:ok, %Result{}}

      iex> delete_result(result)
      {:error, %Ecto.Changeset{}}

  """
  def delete_result(%Result{} = result) do
    Repo.delete(result)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking result changes.

  ## Examples

      iex> change_result(result)
      %Ecto.Changeset{source: %Result{}}

  """
  def change_result(%Result{} = result) do
    Result.changeset(result, %{})
  end
end
