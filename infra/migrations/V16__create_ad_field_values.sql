CREATE TABLE ad_field_values (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  ad_id UUID REFERENCES ads(id) ON DELETE CASCADE,
  field_id UUID REFERENCES category_fields(id) ON DELETE CASCADE,
  value TEXT
);