FROM node:26.8.1-alpine3.24

WORKDIR /app

COPY package.json .

RUN npm i

COPY server.js .

CMD ["node", "server.js"]
