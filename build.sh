#!/usr/bin/env bash

# error handling mode.
set -e

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
    docker-compose run sandbox
fi

# build dependencies and extensions.
if [[ ${TASK} == "all" ]]; then
    docker-compose run sandbox builder.sh --build --extra --main --extensions
fi

# alias builder.sh
if [[ ${TASK} == "builder" ]]; then
    docker-compose run sandbox builder.sh
fi

