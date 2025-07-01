CREATE TABLE ad_interactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  ad_id UUID REFERENCES ads(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id),
  event_type TEXT CHECK (event_type IN ('view', 'click')),
  device TEXT,
  created_at TIMESTAMP DEFAULT now()
);