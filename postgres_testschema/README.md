# postgres_testschema

## データベースマイグレーションに関すること

Go製のマイグレーションツールの `sql-migrate` を使用する。

https://github.com/rubenv/sql-migrate

### sql-migrateをインストールする

```
$ go get -v github.com/rubenv/sql-migrate/...
```

### テーブルを追加するためのマイグレーションファイルを作る

原則として「create_$(テーブル名)_table」というファイル名で作成すること。あと、テーブル名は複数形にすること。

以下のコマンドを`db`ディレクトリ内で実行する。

```
OK パターン
$ sql-migrate new create_users_table
$ sql-migrate new create_videos_table
$ sql-migrate new create_channel_video_joins_table

NG パターン
$ sql-migrate new crate_user_table <- 複数形じゃない
$ sql-migrate new create_channels_videos_joins_table <- 最後だけのsでいい
$ sql-migrate new createuserstable <- スネークケースを使って単語で区切る
```

### テーブルにカラムを追加するマイグレーションファイルを作る

原則として「add\_$(カラム名)\_to\_$(テーブル名)\_table」というファイル名で作成すること。あと、テーブル名は複数形にすること。

example:
```
$ sql-migrate new add_name_to_users_table
$ sql-migrate new add_first_name_to_users_table
```

### カラムの状態を変更するマイグレーションファイルを作る

原則として「change\_$(カラム名)\_in\_$(テーブル名)\_table」というファイル名で作成すること。あと、テーブル名は複数形にすること。

example:
```
$ sql-migrate new change_token_in_users_table
$ sql-migrate new change_title_in_videos_table
```

### カラムの削除をするマイグレーションファイルを作る

原則として「remove\_$(カラム名)\_from\_$(テーブル名)\_table」というファイル名で作成すること。あと、テーブル名は複数形にすること。

example:
```
$ sql-migrate new remove_name_from_users_table
$ sql-migrate new remove_first_name_from_users_table
```

## マイグレーションの実行方法
必ず `-env` オプションをつけてmigrationを実行すること

```
$ sql-migrate up -env postgres
```

