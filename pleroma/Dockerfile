FROM elixir:alpine

ENV MIX_ENV=prod

RUN apk add --no-cache \
    build-base \
    git \
    curl \
    imagemagick && \
    adduser -S -D -h /pleroma pleroma

USER pleroma
WORKDIR /pleroma

ARG branch=stable
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

HEALTHCHECK \
    --start-period=30m \
    --interval=10s \ 
    CMD curl -sSf http://localhost:4000/api/v1/instance > /dev/null || exit 1
