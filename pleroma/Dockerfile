FROM elixir:alpine

ENV MIX_ENV=prod

RUN apk -U upgrade \
    && apk add --no-cache \
       build-base \
       git

RUN adduser -S -D -h /pleroma pleroma

USER pleroma
WORKDIR /pleroma

RUN git clone --depth=1 https://git.pleroma.social/pleroma/pleroma.git /pleroma \
    && mkdir /pleroma/uploads

VOLUME /pleroma/config/prod.secret.exs
VOLUME /pleroma/uploads/

CMD mix local.rebar --force && mix local.hex --force && mix deps.get && mix compile && mix phx.server

