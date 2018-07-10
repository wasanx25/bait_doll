
-- +migrate Up

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age SMALLINT NOT NULL
);

COMMENT ON TABLE users IS 'ユーザーテーブル';
COMMENT ON COLUMN users.name IS 'ユーザーの名前';
COMMENT ON COLUMN users.age IS 'ユーザーの年齢';

-- +migrate Down
