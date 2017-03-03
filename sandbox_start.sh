#!/bin/bash

mkdir -p $(pwd)/.abuild

docker run -it --rm \
    -v $(pwd):/home/sandbox/php-alpine \
    -v $(pwd)/.abuild:/home/sandbox/.abuild \
    -v $(pwd)/repo/7.0:/home/sandbox/packages/7.0 \
    -v $(pwd)/repo/7.1:/home/sandbox/packages/7.1 \
    -v $(pwd)/cache:/var/cache/apk \
    codecasts/php-alpine-sandbox