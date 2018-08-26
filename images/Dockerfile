# Alpine-PHP Base Images.
# Simple base images to start with.

# IMAGE ARGUMENT
ARG ALPINE_VERSION

# ALPINE 3.x.
FROM alpine:$ALPINE_VERSION

# MAINTAINER.
MAINTAINER Diego Hernandes <diego@hernandev.com>

# AFTER IMAGE DEFINITION ARGUMENTS
ARG ALPINE_VERSION
ARG PHP_VERSION

# ADD SDK AND BASIC TOOLS.
RUN apk add --update alpine-sdk sudo git bash nano

# trust this project public key to trust the packages.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# CONFIGURE ALPINE REPOSITORIES AND PHP BUILD DIR.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories && \
    echo "@php https://php.codecasts.rocks/v${ALPINE_VERSION}/php-${PHP_VERSION}" >> /etc/apk/repositories

RUN apk add --update \
    php@php \
    php-mbstring@php

# START WITH BASH.
CMD ["/bin/bash"]