FROM nginx:stable-trixie AS nginx
COPY nginx.conf /etc/nginx/nginx.conf

FROM node:iron-bookworm-slim AS base

FROM base AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM base AS production-deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

FROM base AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./
COPY . ./
RUN npm run build

FROM base AS angular
WORKDIR /app
COPY --from=production-deps /app/node_modules ./
COPY --from=build /app/dist/* ./
EXPOSE 4000
CMD ["node", "./server/server.mjs"]