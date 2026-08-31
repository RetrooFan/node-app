FROM node:26.8.1-alpine3.24 AS base

WORKDIR /home/node

COPY package.json package-lock.json .

RUN npm i

COPY src src

# ----------

FROM base AS dev

USER node

CMD ["npm", "run", "dev"]

# ----------

FROM base AS build

COPY tsconfig.json .

RUN npm run build

# ----------

FROM node:26.8.1-alpine3.24 AS prod

WORKDIR /home/node

COPY package.json package-lock.json .

RUN npm i --only=prod

COPY --from=build /home/node/dist .

USER node

CMD ["npm", "run", "prod"]

# ----------
