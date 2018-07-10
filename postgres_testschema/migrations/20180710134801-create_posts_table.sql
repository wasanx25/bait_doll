
-- +migrate Up

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL
);

COMMENT ON TABLE posts IS 'ユーザー投稿テーブル';
COMMENT ON COLUMN posts.title IS '投稿のタイトル';
COMMENT ON COLUMN posts.body IS '投稿の本文';
COMMENT ON COLUMN posts.user_id IS '投稿したユーザーID';

-- +migrate Down
