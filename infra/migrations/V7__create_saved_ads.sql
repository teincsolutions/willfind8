CREATE TABLE saved_ads (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  ad_id UUID REFERENCES ads(id) ON DELETE CASCADE,
  saved_at TIMESTAMP DEFAULT now(),
  PRIMARY KEY (user_id, ad_id)
);