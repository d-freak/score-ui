defmodule Score.IkanTest do
  use Score.DataCase

  alias Score.Ikan

  describe "user" do
    alias Score.Ikan.User

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ikan.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Ikan.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Ikan.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Ikan.create_user(@valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ikan.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Ikan.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Ikan.update_user(user, @invalid_attrs)
      assert user == Ikan.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Ikan.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Ikan.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Ikan.change_user(user)
    end
  end

  describe "result" do
    alias Score.Ikan.Result

    @valid_attrs %{date: ~N[2010-04-17 14:00:00.000000], memo: "some memo"}
    @update_attrs %{date: ~N[2011-05-18 15:01:01.000000], memo: "some updated memo"}
    @invalid_attrs %{date: nil, memo: nil}

    def result_fixture(attrs \\ %{}) do
      {:ok, result} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ikan.create_result()

      result
    end

    test "list_result/0 returns all result" do
      result = result_fixture()
      assert Ikan.list_result() == [result]
    end

    test "get_result!/1 returns the result with given id" do
      result = result_fixture()
      assert Ikan.get_result!(result.id) == result
    end

    test "create_result/1 with valid data creates a result" do
      assert {:ok, %Result{} = result} = Ikan.create_result(@valid_attrs)
      assert result.date == ~N[2010-04-17 14:00:00.000000]
      assert result.memo == "some memo"
    end

    test "create_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ikan.create_result(@invalid_attrs)
    end

    test "update_result/2 with valid data updates the result" do
      result = result_fixture()
      assert {:ok, result} = Ikan.update_result(result, @update_attrs)
      assert %Result{} = result
      assert result.date == ~N[2011-05-18 15:01:01.000000]
      assert result.memo == "some updated memo"
    end

    test "update_result/2 with invalid data returns error changeset" do
      result = result_fixture()
      assert {:error, %Ecto.Changeset{}} = Ikan.update_result(result, @invalid_attrs)
      assert result == Ikan.get_result!(result.id)
    end

    test "delete_result/1 deletes the result" do
      result = result_fixture()
      assert {:ok, %Result{}} = Ikan.delete_result(result)
      assert_raise Ecto.NoResultsError, fn -> Ikan.get_result!(result.id) end
    end

    test "change_result/1 returns a result changeset" do
      result = result_fixture()
      assert %Ecto.Changeset{} = Ikan.change_result(result)
    end
  end
end
