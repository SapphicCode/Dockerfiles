FROM alpine:edge

RUN touch -r /etc/apk/repositories /tmp/time && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    touch -r /tmp/time /etc/apk/repositories && \
    rm /tmp/time
