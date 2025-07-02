#!/bin/bash

#load .env file if it exists
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# CONFIGURATION
MINIO_ALIAS="prodminio"
MINIO_ENDPOINT="http://localhost:9000"
MINIO_ACCESS_KEY="${MINIO_ROOT_USER}"
MINIO_SECRET_KEY="${MINIO_ROOT_PASSWORD}"

# USERS
ADMIN_USER="admin"
ADMIN_PASS="adminstrongpass"

PUBLIC_USER="frontend"
PUBLIC_PASS="frontendpass"

RESTRICTED_USER="restricted"
RESTRICTED_PASS="restrictedpass"

# BUCKETS
BUCKETS=("product-images" "user-uploads" "order-exports" "admin-assets")

# Ensure mc is installed
if ! command -v mc &> /dev/null; then
  echo "MinIO Client (mc) not found. Please install it first."
  exit 1
fi

# Set alias
mc alias set $MINIO_ALIAS $MINIO_ENDPOINT $MINIO_ACCESS_KEY $MINIO_SECRET_KEY

# Create buckets
for BUCKET in "${BUCKETS[@]}"; do
  mc mb --ignore-existing ${MINIO_ALIAS}/${BUCKET}
done

# Define policies
echo "Creating policy files..."

cat <<EOF > product-readonly.json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["s3:GetObject"],
    "Resource": ["arn:aws:s3:::product-images/*"]
  }]
}
EOF

cat <<EOF > admin-fullaccess.json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["s3:*"],
    "Resource": ["arn:aws:s3:::*"]
  }]
}
EOF

cat <<EOF > user-uploads-readonly.json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["s3:GetObject"],
    "Resource": ["arn:aws:s3:::user-uploads/*", "arn:aws:s3:::order-exports/*"]
  }]
}
EOF

# Add policies
mc admin policy add $MINIO_ALIAS product-readonly product-readonly.json
mc admin policy add $MINIO_ALIAS admin-fullaccess admin-fullaccess.json
mc admin policy add $MINIO_ALIAS user-uploads-readonly user-uploads-readonly.json

# Add users
mc admin user add $MINIO_ALIAS $ADMIN_USER $ADMIN_PASS
mc admin user add $MINIO_ALIAS $PUBLIC_USER $PUBLIC_PASS
mc admin user add $MINIO_ALIAS $RESTRICTED_USER $RESTRICTED_PASS

# Assign policies
mc admin policy set $MINIO_ALIAS admin-fullaccess user=$ADMIN_USER
mc admin policy set $MINIO_ALIAS product-readonly user=$PUBLIC_USER
mc admin policy set $MINIO_ALIAS user-uploads-readonly user=$RESTRICTED_USER

# Cleanup
rm -f *.json

echo "✅ MinIO production setup complete."
