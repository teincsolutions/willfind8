CREATE TABLE chats (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_one_id UUID REFERENCES users(id),
  user_two_id UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT now()
);