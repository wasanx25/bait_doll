
-- +migrate Up

CREATE TABLE companies (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

COMMENT ON TABLE companies IS '会社テーブル';
COMMENT ON COLUMN companies.name IS '会社の名前';

-- +migrate Down
