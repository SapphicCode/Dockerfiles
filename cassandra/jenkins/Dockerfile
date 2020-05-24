FROM jenkins/jenkins:lts-alpine

USER root
RUN apk add --no-cache curl rsync jq docker && \
    chmod +s /usr/bin/docker

USER jenkins
