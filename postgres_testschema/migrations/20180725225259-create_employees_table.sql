
-- +migrate Up

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  company_id INTEGER REFERENCES companies(id),
  name VARCHAR(100) NOT NULL,
  position VARCHAR(100) NOT NULL
);

COMMENT ON TABLE employees IS '従業員テーブル';
COMMENT ON COLUMN employees.name IS '従業員の名前';
COMMENT ON COLUMN employees.position IS '従業員の役職';

-- +migrate Down
