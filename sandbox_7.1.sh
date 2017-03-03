#!/bin/bash

mkdir -p $(pwd)/.abuild

docker run -it --rm \
    -v $(pwd)/7.1:/home/sandbox/7.1 \
    -v $(pwd)/.abuild:/home/sandbox/.abuild \
    -v $(pwd)/repo/7.1:/home/sandbox/packages/7.1 \
    -v $(pwd)/cache:/var/cache/apk \
    codecasts/php-alpine:7.1