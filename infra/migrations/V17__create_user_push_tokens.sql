CREATE TABLE user_push_tokens (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  expo_token TEXT,
  platform TEXT,
  created_at TIMESTAMP DEFAULT now()
);