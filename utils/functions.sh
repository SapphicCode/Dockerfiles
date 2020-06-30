#!/bin/sh

mkdir -p cache

should_build() {
    file=cache/built.$(echo "$1" | sha256sum | cut -d " " -f 1)
    if [ -e "$file" ]; then
        return 1
    fi
    return 0
}

built() {
    file=cache/built.$(echo "$1" | sha256sum | cut -d " " -f 1)
    touch "$file"
}

