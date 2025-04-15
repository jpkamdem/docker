FROM node:18-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm i

COPY . .
RUN npm run build

FROM node:18-alpine AS runtime
WORKDIR /app

RUN npm install pm2 -g
RUN apk add --no-cache curl
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./
COPY --from=builder /app/package-lock.json ./
COPY --from=builder /app/process.yaml ./

RUN npm ci --omit=dev

ENV NODE_ENV=production
ENV PORT=3001
EXPOSE 3001

CMD [ "pm2-runtime", "process.yaml" ]