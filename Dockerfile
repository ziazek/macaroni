FROM elixir:1.9.1-alpine as build

# # install build dependencies
RUN apk add --no-cache \
  gcc \
  g++ \
  git \
  make \
  musl-dev
RUN mix do local.hex --force, local.rebar --force
WORKDIR /app

FROM build as deps

COPY mix.exs mix.lock ./

ARG MIX_ENV=prod
ENV MIX_ENV=$MIX_ENV
RUN mix do deps.get --only=$MIX_ENV, deps.compile

FROM deps as releaser
COPY . .
ENV MIX_ENV=$MIX_ENV
RUN mix phx.digest
RUN mix release

# Release
FROM alpine:3.9

RUN apk add --no-cache bash libstdc++ openssl jq curl
WORKDIR /app
COPY --from=releaser /app/_build/prod/rel/macaroni ./
# RUN adduser --create-home app

COPY ./start.sh .

RUN addgroup -S app && adduser -S -G app app
RUN chown -R app: ./
RUN ["chmod", "+x", "start.sh"]
USER app


# ENTRYPOINT ["./bin/macaroni", "start"]
ENTRYPOINT ./start.sh
