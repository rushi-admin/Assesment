# build stage
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

# runtime stage (minimal)
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app . 
RUN addgroup -S app && adduser -S app -G app
USER app
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s CMD wget -q --spider http://127.0.0.1:3000/health || exit 1
CMD ["node","index.js"]
