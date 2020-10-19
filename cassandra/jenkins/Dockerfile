# fetch some bleeding-edge Go binaries
FROM alpine:edge AS bleeding

RUN apk add --no-cache rclone restic vault

# copy into Jenkins
FROM jenkins/jenkins:lts-alpine

USER root
COPY --from=bleeding /usr/sbin/vault /usr/local/bin/vault
COPY --from=bleeding /usr/bin/restic /usr/local/bin/restic
COPY --from=bleeding /usr/bin/rclone /usr/local/bin/rclone
RUN apk add --no-cache curl rsync jq docker && \
    chmod +s /usr/bin/docker

USER jenkins
