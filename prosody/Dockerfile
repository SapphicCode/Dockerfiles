FROM alpine:edge

RUN apk update && apk upgrade && apk add lua-dbi prosody

USER prosody
ENTRYPOINT ["prosody"]
