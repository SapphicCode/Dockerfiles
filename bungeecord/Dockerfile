FROM adoptopenjdk/openjdk11-openj9:alpine-jre

ARG uid=1000
ARG url="https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar"

RUN mkdir -p /server/work
RUN apk add curl && \
	curl -s -L $url -o /server/proxy.jar && \
	apk del curl
RUN chown -R $uid:$uid /server

USER ${uid}
WORKDIR /server/work
VOLUME /server/work

ENTRYPOINT ["java", "-jar", "../proxy.jar"]
STOPSIGNAL SIGINT
