# php-alpine: clean alpine + repository packages for installing.
# nothing comes intalled on this image, only available locally for install.
# you still need to run "apk add" to install packages.

# arg for alpine version.
ARG ALPINE_VERSION

# define alpine version to use as base image.
FROM alpine:$ALPINE_VERSION

# args for alpine and php versions.
ARG ALPINE_VERSION
ARG PHP_VERSION

# configure base repositories.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories

# configure php-alpine repository.
RUN echo "/opt/php-alpine/v${ALPINE_VERSION}/php-${PHP_VERSION}" >> /etc/apk/repositories

# add pub key.
ADD key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# add package repository.
ADD v${ALPINE_VERSION}/php-${PHP_VERSION} /opt/php-alpine/v${ALPINE_VERSION}/php-${PHP_VERSION}
