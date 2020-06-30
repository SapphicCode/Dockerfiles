#!/bin/sh

# push to docker hub
for image in $(docker images --format "{{.Repository}}:{{.Tag}}" | grep "${DOCKER_ROOT}"); do
  echo Pushing "${image}"...
  docker push "${image}" > /dev/null || exit 1
  echo Pushed image.
done
