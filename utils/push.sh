#!/bin/sh

# check we're not in a pull request
if [ -n "$TRAVIS" ]; then
  if [ "$TRAVIS_BRANCH" != "master" ]; then
    echo "Other branch detected, ignoring push."
    return 0
  elif [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    echo "Pull request detected, ignoring push."
    return 0
  fi
fi

# push to docker hub
for image in $(docker images --format "{{.Repository}}:{{.Tag}}" | grep "${BUILD_ROOT}"); do
  echo Pushing "${image}" to Docker Hub...
  docker push "${DOCKER_ROOT}/${image#"${BUILD_ROOT}"}" > /dev/null || exit 1
  echo Pushing "${image}" to Quay...
  docker push "${QUAY_ROOT}/${image#"${BUILD_ROOT}"}" > /dev/null || exit 1
  echo Pushed image.
done
