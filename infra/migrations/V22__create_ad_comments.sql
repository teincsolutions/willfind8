CREATE TABLE ad_comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  ad_id UUID REFERENCES ads(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT now()
);
