FROM alpine:edge

RUN apk add --no-cache tini transmission-daemon transmission-cli

ENTRYPOINT [ "tini", "transmission-daemon", "-f"]
