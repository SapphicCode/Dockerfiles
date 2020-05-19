FROM jenkins/jenkins:lts-alpine

USER root
RUN apk add --no-cache curl jq docker && \
    chmod +s /usr/bin/docker

USER jenkins
