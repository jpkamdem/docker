FROM node:24-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm i
COPY . ./
RUN npm run build
COPY .env build/

FROM node:24-alpine AS server
WORKDIR /app
COPY --from=base /app/build ./
RUN npm ci --omit="dev"
EXPOSE 3333
CMD ["sh", "-c", "node ace migration:fresh --seed --force && node bin/server.js"]
