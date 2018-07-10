
-- +migrate Up

CREATE TABLE users_groups_relations (
  user_id INTEGER NOT NULL,
  group_id INTEGER NOT NULL
);

COMMENT ON TABLE users_groups_relations IS 'ユーザーとグループを紐づけるためのテーブル';
COMMENT ON COLUMN users_groups_relations.user_id IS '紐づくユーザーID';
COMMENT ON COLUMN users_groups_relations.group_id IS '紐づくグループID';

-- +migrate Down
