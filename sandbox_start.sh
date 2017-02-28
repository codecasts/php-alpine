#!/bin/bash

mkdir -p $(pwd)/.abuild

docker run -it --rm \
    -v $(pwd):/home/sandbox/php-alpine \
    -v $(pwd)/.abuild:/home/sandbox/.abuild \
    codecasts/php-alpine-sandbox