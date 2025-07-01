CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  seller_id UUID REFERENCES users(id),
  promotion_id UUID REFERENCES promotions(id),
  amount NUMERIC(10, 2),
  payment_method TEXT,
  paid_at TIMESTAMP DEFAULT now()
);