FROM adoptopenjdk/openjdk9-openj9:alpine

ARG uid=1000

RUN mkdir -p /server/work
RUN apk add curl && \
	curl https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar -o /server/bungeecord.jar && \
	apk del curl
RUN chown -R $uid:$uid /server

USER ${uid}
WORKDIR /server/work
VOLUME /server/work

ENTRYPOINT ["java", "-jar", "../bungeecord.jar"]
STOPSIGNAL SIGINT
