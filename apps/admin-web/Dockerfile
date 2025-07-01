# --- Build Stage ---
FROM node:18-alpine AS builder
# Set the working directory
WORKDIR /app

# Install dependencies early for caching
COPY package*.json ./
RUN npm install

# Copy source and build the Next.js app
COPY . .
RUN npm run build

# --- Production Stage ---
FROM node:18-alpine AS runner

# Update Alpine packages to address vulnerabilities
RUN apk update && apk upgrade --no-cache

# Set the working directory
WORKDIR /app

# Only copy necessary files from build stage
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# Expose default Next.js port
EXPOSE 3000

# Run the production server
CMD ["npm", "start"]
