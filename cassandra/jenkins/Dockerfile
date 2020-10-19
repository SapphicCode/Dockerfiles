FROM jenkins/jenkins:lts-alpine

USER root
RUN apk add --no-cache curl rsync jq docker ansible restic rclone && \
    chmod +s /usr/bin/docker

USER jenkins
