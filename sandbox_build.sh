#!/bin/bash

docker build -f sandbox/Dockerfile-base -t codecasts/php-alpine:base sandbox
docker build -f sandbox/Dockerfile-7.0 -t codecasts/php-alpine:7.0 sandbox
docker build -f sandbox/Dockerfile-7.1 -t codecasts/php-alpine:7.1 sandbox