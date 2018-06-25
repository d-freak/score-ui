defmodule ScoreWeb.ScoreControllerTest do
  use ScoreWeb.ConnCase

  alias Score.Ikan

  @create_attrs %{game_id: 42, user_id: 42, value: 42}
  @update_attrs %{game_id: 43, user_id: 43, value: 43}
  @invalid_attrs %{game_id: nil, user_id: nil, value: nil}

  def fixture(:score) do
    {:ok, score} = Ikan.create_score(@create_attrs)
    score
  end

  describe "index" do
    test "lists all score", %{conn: conn} do
      conn = get conn, score_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Score"
    end
  end

  describe "new score" do
    test "renders form", %{conn: conn} do
      conn = get conn, score_path(conn, :new)
      assert html_response(conn, 200) =~ "New Score"
    end
  end

  describe "create score" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, score_path(conn, :create), score: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == score_path(conn, :show, id)

      conn = get conn, score_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Score"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, score_path(conn, :create), score: @invalid_attrs
      assert html_response(conn, 200) =~ "New Score"
    end
  end

  describe "edit score" do
    setup [:create_score]

    test "renders form for editing chosen score", %{conn: conn, score: score} do
      conn = get conn, score_path(conn, :edit, score)
      assert html_response(conn, 200) =~ "Edit Score"
    end
  end

  describe "update score" do
    setup [:create_score]

    test "redirects when data is valid", %{conn: conn, score: score} do
      conn = put conn, score_path(conn, :update, score), score: @update_attrs
      assert redirected_to(conn) == score_path(conn, :show, score)

      conn = get conn, score_path(conn, :show, score)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, score: score} do
      conn = put conn, score_path(conn, :update, score), score: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Score"
    end
  end

  describe "delete score" do
    setup [:create_score]

    test "deletes chosen score", %{conn: conn, score: score} do
      conn = delete conn, score_path(conn, :delete, score)
      assert redirected_to(conn) == score_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, score_path(conn, :show, score)
      end
    end
  end

  defp create_score(_) do
    score = fixture(:score)
    {:ok, score: score}
  end
end
