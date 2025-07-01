CREATE TABLE ads (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  seller_id UUID REFERENCES users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  category TEXT,
  location TEXT,
  media JSONB,
  is_promoted BOOLEAN DEFAULT FALSE,
  city_id UUID,
  created_at TIMESTAMP DEFAULT now()
);