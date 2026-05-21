# Stage 1: Build
FROM node:24 AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --omit=dev

# Stage 2: Runtime
FROM node:24-alpine

RUN addgroup -S app && adduser -S app -G app

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app /usr/src/app

COPY . .

USER app

EXPOSE 3000

CMD ["node", "app.js"]