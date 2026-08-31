FROM node:26.8.1-alpine3.24 AS alpine

# ----------

FROM alpine AS base

WORKDIR /home/node

COPY package.json package-lock.json .

RUN npm ci

COPY src src

# ----------

FROM base AS dev

ENV NODE_ENV=dev

USER node

CMD ["npm", "run", "dev"]

# ----------

FROM base AS build

COPY tsconfig.json .

RUN npm run build

# ----------

FROM alpine AS prod

WORKDIR /home/node

COPY package.json package-lock.json .

RUN npm ci --only=prod

COPY --from=build /home/node/dist .

ENV NODE_ENV=prod

USER node

CMD ["npm", "run", "prod"]

# ----------
