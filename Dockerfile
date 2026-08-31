FROM node:26.8.1-alpine3.24

WORKDIR /app

COPY package.json package-lock.json .

RUN npm i

COPY src .

CMD ["node", "server.js"]
