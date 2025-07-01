CREATE TABLE ad_tag_links (
  ad_id UUID REFERENCES ads(id) ON DELETE CASCADE,
  tag_id UUID REFERENCES ad_tags(id) ON DELETE CASCADE,
  PRIMARY KEY (ad_id, tag_id)
);