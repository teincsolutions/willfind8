CREATE TABLE seller_profiles (
  user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  business_name TEXT,
  business_type TEXT,
  bio TEXT,
  website TEXT,
  email TEXT,
  phone TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  created_at TIMESTAMP DEFAULT now()
);