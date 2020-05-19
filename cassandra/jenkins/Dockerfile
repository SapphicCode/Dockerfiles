FROM jenkins/jenkins:lts-alpine

# test jenkins rebuild
USER root
RUN apk add --no-cache curl jq docker && \
    chmod +s /usr/bin/docker

USER jenkins
