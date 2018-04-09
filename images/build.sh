#!/usr/bin/env bash

######################################
#### Build for Base images.       ####
######################################


# List of Alpine versions to Use as Base.
ALPINE_VERSIONS="3.6 3.7"
# List of PHP versions to build.
PHP_VERSIONS="7.1 7.2"

# include the build functions.
source $(pwd)/_functions.sh

# Pull Alpine versions.
pull_images
# Build the Docker base images.
build_images
# Publish the resulting images.
publish_images



