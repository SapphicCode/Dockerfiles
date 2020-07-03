#!/bin/bash

source utils/functions.sh

base="${DOCKER_ROOT}/${2}"
if [ "${3}" = "daily" ] || [ -z "$3" ]; then
    count="d$(date -u +%s | xargs -I date expr date / 60 / 60 / 24)"
elif [ "${3}" = "weekly" ]; then
    count="w$(date -u +%s | xargs -I date expr date / 60 / 60 / 24 / 7)"
fi
sum=$(tar -c "${1}" | sha256sum | cut -d " " -f 1)
if should_build "${count}-${sum}"; then
    docker build "${1}" -t "${base}:latest" && built "${count}-${sum}" || exit 1
else
    echo "Image already built, ignoring."
fi
