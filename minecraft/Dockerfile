FROM adoptopenjdk/openjdk11-openj9:alpine-jre

ARG minecraft_url

WORKDIR /server/work
RUN mkdir -p /server/work
RUN apk add --no-cache curl tini && \
    curl -s -L $minecraft_url -o /server/server.jar && \
    apk del curl
COPY start.sh /server/
RUN chown -R 1000:1000 /server

USER 1000
STOPSIGNAL SIGINT
VOLUME /server/work
ENTRYPOINT ["/sbin/tini", "../start.sh"]
