CREATE TABLE client_block (
  id             UUID PRIMARY KEY,
  client_id      UUID        NOT NULL,
  block_type     TEXT        NOT NULL,
  status         TEXT        NOT NULL,
  reason         TEXT,
  created_at     TIMESTAMPTZ NOT NULL,
  created_by     TEXT        NOT NULL,
  released_at    TIMESTAMPTZ,
  released_by    TEXT,
  release_reason TEXT,
  expires_at     TIMESTAMPTZ
);

CREATE TABLE audit_log (
  id         BIGSERIAL    PRIMARY KEY,
  event_time TIMESTAMPTZ  NOT NULL,
  actor      TEXT         NOT NULL,
  action     TEXT         NOT NULL,
  client_id  UUID,
  block_id   UUID,
  details    JSONB
);

CREATE UNIQUE INDEX IF NOT EXISTS uq_client_block_active
  ON client_block (client_id)
  WHERE status = 'ACTIVE';


  
