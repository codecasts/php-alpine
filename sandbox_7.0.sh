#!/bin/bash

mkdir -p $(pwd)/.abuild

docker run -it --rm \
    -v $(pwd)/7.0:/home/sandbox/7.0 \
    -v $(pwd)/.abuild:/home/sandbox/.abuild \
    -v $(pwd)/repo/7.0:/home/sandbox/packages/7.0 \
    -v $(pwd)/cache:/var/cache/apk \
    codecasts/php-alpine:7.0