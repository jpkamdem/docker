FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=builder /app/build ./build
COPY --from=builder /app/.env ./build
COPY --from=builder /app/start.sh ./
RUN chmod +x ./start.sh

CMD ["./start.sh"]