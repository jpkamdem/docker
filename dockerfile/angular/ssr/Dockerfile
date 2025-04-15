FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:18-alpine AS server
WORKDIR /app
COPY --from=build /app/dist/second-app ./
EXPOSE 4000
CMD [ "node", "server/server.mjs" ]