CREATE TABLE promotion_usages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  plan_id UUID REFERENCES promotion_plans(id),
  promotion_id UUID REFERENCES promotions(id),
  status VARCHAR(10) CHECK (status IN ('unused', 'applied', 'expired')),
  purchased_at TIMESTAMP DEFAULT now()
);