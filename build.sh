#!/usr/bin/env bash

# source environment variables for the time being.
source ./.env

# determine task to build.
TASK=${1}

# fallback to help if no task was provided.
if [[ -z "${TASK}" ]]; then
    TASK="help"
fi

# build sandbox
if [[ ${TASK} == "sandbox" ]]; then
    docker-compose build sandbox
fi

# build sandbox
if [[ ${TASK} == "shell" ]]; then
    docker-compose run sandbox bash
fi

# build dependencies and extensions.
if [[ ${TASK} == "build" ]]; then
    docker-compose run sandbox ./build.sh --full
fi

# build dependencies and extensions.
if [[ ${TASK} == "extensions" ]]; then
    docker-compose run sandbox ./build.sh
fi
