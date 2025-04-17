#!/bin/sh
cd build/
npm ci --omit='dev'
node ace migration:run --force
node bin/server.js