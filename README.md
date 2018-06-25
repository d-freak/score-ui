# 環境構築

1. グローバル環境に以下をインストール
    - `dnf install nodejs`
    - `dnf install sqlite`  # SQLiteを使用する場合
    - `dnf install erlang`
    - `dnf install elixir`
    - `dnf install rebar`
    - `dnf install inotify-tools`

1. npmアップデートツールを導入しておく
    - `npm -g install npm-check-updates`

1. ローカル環境にhexをインストール
    - `mix local.hex`
    - パッケージ管理ツールであり、npmやgem相当のもの

1. ローカル環境にphoenixをインストール
    - `mix archive.install /path/to/phx_new.ez`
    - 入手先は以下
        - https://github.com/phoenixframework/archives

----

# 開発準備 (クローン後にやること)

1. プロジェクトのルートディレクトリに移動
    - `cd sample_project`

1. 依存パッケージを取得
    - `mix deps.get`
    - `cd assets`
    - `npm-check-updates -u`
    - `npm install`
    - `cd ..`

1. データベースのマイグレーション
    - `mix ecto.migrate`

1. サーバを起動
    - `mix phx.server`
        - この状態で `http://localhost:54334/` にブラウザでアクセスする

