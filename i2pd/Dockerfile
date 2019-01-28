FROM alpine:edge
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk upgrade && apk add i2pd@testing

ENTRYPOINT ["i2pd"]

