# Alpicetera - Building sandbox image.

# arg for using a specific Alpine version (before FROM)
ARG ALPINE_VERSION
ARG DOCKER_PLATFORM

# use alpine version from argument as base/from image.
FROM --platform=$DOCKER_PLATFORM alpine:$ALPINE_VERSION

RUN echo -e "I am running on $DOCKER_PLATFORM, building for $TARGETPLATFORM"

# maintainer label.
MAINTAINER Diego Hernandes <iamhernandev@gmail.com>

# declare required build arguments.
ARG ALPINE_VERSION
ARG APK_PACKAGER
ARG APK_MAINTAINER

# make args available as env vars.
ENV ENV="/etc/profile" \
    ALPINE_VERSION=${ALPINE_VERSION} \
    APK_PACKAGER=${APK_PACKAGER} \
    APK_MAINTAINER=${APK_MAINTAINER} \
    APORTS=/home/sandbox/scripts \
    TERM=xterm-256color \
    COLORTERM=truecolor \
    EDITOR=nano

# install some required tools.
RUN apk add --update-cache \
    alpine-sdk \
    aports-build \
    ncurses \
    sudo \
    bash \
    nano

# configure APK repositories.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories

# add opt scripts.
ADD opt /opt
# add etc configuration.
ADD etc /etc

# ADD THE PUBLIC KEY FOR REPOS.
# COPY ${APK_PUB_KEY} /etc/apk/keys/php-alpine.rsa.pub

# CONFIGURE BUILD.
RUN adduser -D -u 1000 sandbox && \
    addgroup sandbox abuild && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles && \
    chmod +x /opt/php-alpine/entrypoint.sh && \
    chmod +x /opt/php-alpine/checksum-all.sh && \
    mkdir -p /var/cache/apk && \
    ln -s /var/cache/apk /etc/apk/cache && \
    echo "sandbox  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "Set disable_coredump false" >> /etc/sudo.conf && \
    sed -i "/#PACKAGER=.*/c\PACKAGER=\"${APK_PACKAGER}\"" /etc/abuild.conf && \
    sed -i "/#MAINTAINER=.*/c\MAINTAINER=\"${APK_MAINTAINER}\"" /etc/abuild.conf && \
    echo 'export PATH="/opt/php-alpine/bin:$PATH"' > /etc/profile.d/php-bin.sh && \
    chown -R sandbox:sandbox /home/sandbox && \
    chown -R sandbox:sandbox /opt/php-alpine

# required for running "aports-build" tool.
RUN mkdir -p /var/run/mqtt-exec.aports-build && \
    chown -R sandbox:abuild /var/run/mqtt-exec.aports-build && \
    chmod 755 /var/run/mqtt-exec.aports-build

# switch to sandbox user.
USER sandbox

# create some required directories.
RUN mkdir -p /home/sandbox/scripts && \
    mkdir -p /home/sandbox/packages

# update repos.
USER root
RUN apk update

# switch to sandbox user.
USER sandbox

# set entrypoint.
ENTRYPOINT ["/opt/php-alpine/entrypoint.sh"]

# set container workdir.
WORKDIR "/home/sandbox/scripts"

# use bash as default command.
CMD ["/bin/ash"]
