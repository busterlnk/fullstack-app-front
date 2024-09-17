FROM node:20.4-bullseye-slim

RUN npm install pm2@latest -g

USER node

ENTRYPOINT ["bash", "/app/npm_starter.sh" ]
