FROM adoptopenjdk/openjdk8-openj9:alpine

ARG minecraft_url

WORKDIR /server/work
RUN mkdir -p /server/work
RUN apk add curl && \
    curl $minecraft_url -o /server/server.jar && \
    apk del curl
COPY start.sh /server/
RUN chown -R 1000:1000 /server

USER 1000
STOPSIGNAL SIGINT
VOLUME /server/work
ENTRYPOINT ["../start.sh"]
