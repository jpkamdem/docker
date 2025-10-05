FROM node:24-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:24-alpine AS server
WORKDIR /app
COPY --from=build /app/dist/webapp-name ./
EXPOSE 4000
CMD [ "node", "server/server.mjs" ]
