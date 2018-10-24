FROM alpine:latest

RUN apk update && apk add znc
RUN adduser -S -u 900 -h /data zncrunner

USER zncrunner
WORKDIR /data

ENTRYPOINT ["znc", "-d=/data", "-f"]
VOLUME /data
