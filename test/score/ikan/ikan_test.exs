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

  describe "game" do
    alias Score.Ikan.Game

    @valid_attrs %{result_id: 42}
    @update_attrs %{result_id: 43}
    @invalid_attrs %{result_id: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ikan.create_game()

      game
    end

    test "list_game/0 returns all game" do
      game = game_fixture()
      assert Ikan.list_game() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Ikan.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Ikan.create_game(@valid_attrs)
      assert game.result_id == 42
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ikan.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, game} = Ikan.update_game(game, @update_attrs)
      assert %Game{} = game
      assert game.result_id == 43
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Ikan.update_game(game, @invalid_attrs)
      assert game == Ikan.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Ikan.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Ikan.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Ikan.change_game(game)
    end
  end

  describe "score" do
    alias Score.Ikan.Score

    @valid_attrs %{game_id: 42, user_id: 42, value: 42}
    @update_attrs %{game_id: 43, user_id: 43, value: 43}
    @invalid_attrs %{game_id: nil, user_id: nil, value: nil}

    def score_fixture(attrs \\ %{}) do
      {:ok, score} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ikan.create_score()

      score
    end

    test "list_score/0 returns all score" do
      score = score_fixture()
      assert Ikan.list_score() == [score]
    end

    test "get_score!/1 returns the score with given id" do
      score = score_fixture()
      assert Ikan.get_score!(score.id) == score
    end

    test "create_score/1 with valid data creates a score" do
      assert {:ok, %Score{} = score} = Ikan.create_score(@valid_attrs)
      assert score.game_id == 42
      assert score.user_id == 42
      assert score.value == 42
    end

    test "create_score/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ikan.create_score(@invalid_attrs)
    end

    test "update_score/2 with valid data updates the score" do
      score = score_fixture()
      assert {:ok, score} = Ikan.update_score(score, @update_attrs)
      assert %Score{} = score
      assert score.game_id == 43
      assert score.user_id == 43
      assert score.value == 43
    end

    test "update_score/2 with invalid data returns error changeset" do
      score = score_fixture()
      assert {:error, %Ecto.Changeset{}} = Ikan.update_score(score, @invalid_attrs)
      assert score == Ikan.get_score!(score.id)
    end

    test "delete_score/1 deletes the score" do
      score = score_fixture()
      assert {:ok, %Score{}} = Ikan.delete_score(score)
      assert_raise Ecto.NoResultsError, fn -> Ikan.get_score!(score.id) end
    end

    test "change_score/1 returns a score changeset" do
      score = score_fixture()
      assert %Ecto.Changeset{} = Ikan.change_score(score)
    end
  end
end
