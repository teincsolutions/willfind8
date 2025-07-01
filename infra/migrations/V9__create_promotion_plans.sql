CREATE TABLE promotion_plans (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT,
  cost NUMERIC(10, 2),
  duration_days INTEGER,
  weight INTEGER,
  description TEXT
);