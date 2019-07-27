FROM elixir:alpine

ENV MIX_ENV=prod

RUN apk -U upgrade \
    && apk add --no-cache \
       build-base \
       git \
       imagemagick

RUN adduser -S -D -h /pleroma pleroma

USER pleroma
WORKDIR /pleroma

ARG branch=master
RUN git clone --depth=1 --branch=$branch https://git.pleroma.social/pleroma/pleroma.git /pleroma \
    && mkdir -p /pleroma/uploads
RUN touch /pleroma/config/prod.secret.exs \
    && mix local.rebar --force \
    && mix local.hex --force \
    && mix deps.get \
    && mix deps.compile \
    && rm /pleroma/config/prod.secret.exs

VOLUME /pleroma/config/prod.secret.exs
VOLUME /pleroma/uploads/

CMD time mix compile && mix ecto.migrate && mix phx.server
EXPOSE 4000

