CREATE TABLE promotions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  ad_id UUID REFERENCES ads(id) ON DELETE CASCADE,
  seller_id UUID REFERENCES users(id),
  plan_id UUID REFERENCES promotion_plans(id),
  start_date DATE,
  end_date DATE,
  status VARCHAR(10) CHECK (status IN ('active', 'expired', 'pending')),
  created_at TIMESTAMP DEFAULT now()
);