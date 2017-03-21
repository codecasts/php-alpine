#!/bin/bash

docker build --no-cache -f sandbox/Dockerfile-base -t codecasts/php-alpine:base sandbox
docker build --no-cache -f sandbox/Dockerfile-7.0 -t codecasts/php-alpine:7.0 sandbox
docker build --no-cache -f sandbox/Dockerfile-7.1 -t codecasts/php-alpine:7.1 sandbox
