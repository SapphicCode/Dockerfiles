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
  hub_image="${DOCKER_ROOT}${image#"${BUILD_ROOT}"}"
  docker tag "${image}" "${hub_image}"
  docker push "${hub_image}" > /dev/null || exit 1
  echo Pushing "${image}" to Quay...
  quay_image="${QUAY_ROOT}${image#"${BUILD_ROOT}"}"
  docker tag "${image}" "${quay_image}"
  docker push "${quay_image}" > /dev/null || exit 1
  echo Pushed image.
done
