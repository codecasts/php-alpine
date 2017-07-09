#!/bin/bash

# DECLARE ALPINE VERSION TO BUILD.
ALPINE_VERSION=$1

# PULL LATEST ALPINE IMAGE WITHIN VERSION.
docker pull "alpine:$ALPINE_VERSION"

# BUILD THE IMAGE.
docker build -f "sandbox/$ALPINE_VERSION/Dockerfile" -t "codecasts/php-alpine:$ALPINE_VERSION" "sandbox/$ALPINE_VERSION"
