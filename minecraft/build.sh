#!/bin/bash

# shellcheck disable=SC1091
source utils/functions.sh

base=$DOCKER_ROOT/minecraft

manifest=$(curl -ss https://launchermeta.mojang.com/mc/game/version_manifest.json)
latest_release=$(echo "${manifest}" | jq -r .latest.release)
latest_snapshot=$(echo "${manifest}" | jq -r .latest.snapshot)

find_vanilla_url() {
  version_manifest_url=$(echo "${manifest}" | jq -r --arg v "${1}" '.versions[] | select(.id==$v) | .url')
  curl -ss "${version_manifest_url}" | jq -r .downloads.server.url
}

build() {
  canonical_image="${base}:${1}-${2}"
	if should_build "$canonical_image"; then
    echo Building "${canonical_image}"...
    if [ -z "${3}" ]; then
      url=$(find_vanilla_url "${2}")
    else
      url=${3}
    fi
    docker build \
      --build-arg minecraft_url="${url}" \
      -t "${canonical_image}" \
      -t "${base}:${1}" \
      minecraft && built "${canonical_image}"
    if [ "${1}" = "vanilla-release" ]; then
      docker tag "${canonical_image}" "${base}:latest"
    fi
  else
    echo Skipping "${canonical_image}".
  fi
}

# build release
build vanilla-release "${latest_release}"
# build snapshot
build vanilla-snapshot "${latest_snapshot}"
# build paper
build paper-release "${latest_release}" "https://papermc.io/api/v1/paper/${latest_release}/latest/download"

# push to docker hub
for image in $(docker images "${base}" --format "{{.Repository}}:{{.Tag}}"); do
  image_id=$(docker images "${image}" --format "{{.ID}}")
  push_file=cache/pushed.$(echo "${image}.${image_id}" | sha256sum | cut -d " " -f 1)
  if ! [ -e "${push_file}" ]; then
    echo Pushing "${image}"...
    docker push "${image}" > /dev/null
    echo Pushed image.
    touch "${push_file}"
  else
    echo "Skipping push of ${image}, already pushed."
  fi
done
