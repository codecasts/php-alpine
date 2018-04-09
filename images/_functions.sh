#!/usr/bin/env bash

## Function to Pull base Alpine Images.
function pull_images {
    # verbose.
    echo -e "\n\n=====> Pulling Alpine Images:\n"

    # loop the versions and pull each one.
    for ALPINE_VERSION in $ALPINE_VERSIONS; do
        # verbose.
        echo -e "\n\n=====> Pulling Alpine v$ALPINE_VERSION\n"
        # execute docker pull.
        docker pull "alpine:$ALPINE_VERSION"
    done
}

# pull image functions.
function build_images {
    # verbose.
    echo -e "\n\n=====> Building PHP versions: $PHP_VERSIONS\n"

    # loop the versions of alpine.
    for ALPINE_VERSION in $ALPINE_VERSIONS; do
        # loop the PHP versions to build.
        for PHP_VERSION in $PHP_VERSIONS; do
            # alias the target image name.
            TARGET="codecasts/alpine-$ALPINE_VERSION:php-$PHP_VERSION"
            # verbose.
            echo -e "\n\n=====> Building Image: $TARGET\n"
            # execute the docker build.
            docker build -t "$TARGET" -f "alpine-$ALPINE_VERSION-php-$PHP_VERSION" .
        done
        # end PHP loop.
    done
    # end Alpine loop.
}

# publish images.
function publish_images {
    # verbose.
    echo -e "\n\n=====> Building Images:\n"

    # loop the versions of alpine.
    for ALPINE_VERSION in $ALPINE_VERSIONS; do
        # loop the PHP versions to publish.
        for PHP_VERSION in $PHP_VERSIONS; do
            # alias the target image name.
            TARGET="codecasts/alpine-$ALPINE_VERSION:php-$PHP_VERSION"
            # verbose
            echo -e "\n\n=====> Publishing Image: $TARGET\n"
            # execute the docker push
            docker push $TARGET
        done
        # end PHP loop.
    done
    # end Alpine loop.
}