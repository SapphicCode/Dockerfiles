FROM alpine:edge

RUN apk add --no-cache tini lua-dbi prosody

USER prosody
ENTRYPOINT ["/sbin/tini", "prosody"]
