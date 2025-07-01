FROM node:20-alpine

# Update Alpine packages to address vulnerabilities
RUN apk update && apk upgrade --no-cache

WORKDIR /app
COPY . .
RUN npm install

EXPOSE 3000
CMD ["npm", "start"]
