FROM alpine:edge

RUN apk add --no-cache tini ca-certificates lua-dbi prosody

USER prosody
ENTRYPOINT ["/sbin/tini", "prosody"]
