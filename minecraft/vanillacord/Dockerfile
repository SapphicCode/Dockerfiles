ARG base=pandentia/minecraft:latest

FROM ${base} AS vanilla

FROM adoptopenjdk/openjdk11:alpine AS build
WORKDIR /tmp/
COPY --from=vanilla /server/server.jar /tmp/
COPY vanillacord.jar /tmp/
RUN java -jar vanillacord.jar server.jar

FROM ${base}
COPY --from=build /tmp/server-bungee.jar /server/server.jar
