CREATE TABLE seller_verification (
  user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  id_type TEXT,
  id_number TEXT,
  id_document TEXT,
  face_pictures TEXT,
  status VARCHAR(10) CHECK (status IN ('pending', 'verified', 'rejected')),
  reviewed_at TIMESTAMP
);