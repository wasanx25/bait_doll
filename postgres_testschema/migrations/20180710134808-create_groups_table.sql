
-- +migrate Up

CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

COMMENT ON TABLE groups IS 'グループテーブル';
COMMENT ON COLUMN groups.name IS 'グループの名前';

-- +migrate Down
