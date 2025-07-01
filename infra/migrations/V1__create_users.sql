CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  role VARCHAR(10) NOT NULL CHECK (role IN ('visitor', 'seller')),
  full_name TEXT NOT NULL,
  username TEXT UNIQUE NOT NULL,
  given_name TEXT,
  family_name TEXT,
  profile_picture TEXT,
  sex TEXT CHECK (sex IN ('male', 'female', 'other')) DEFAULT 'other',
  date_of_birth DATE,
  email TEXT UNIQUE,
  phone TEXT,
  password_hash TEXT,
  auth_provider TEXT DEFAULT 'local',
  otp_verified BOOLEAN DEFAULT FALSE,
  enable_2fa BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT now()
);