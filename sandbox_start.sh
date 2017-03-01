#!/bin/bash

mkdir -p $(pwd)/.abuild

docker run -it --rm \
    -v $(pwd):/home/sandbox/php-alpine \
    -v $(pwd)/.abuild:/home/sandbox/.abuild \
    -v $(pwd)/repo:/home/sandbox/packages/php-alpine \
    -v $(pwd)/cache:/var/cache/apk \
    codecasts/php-alpine-sandbox