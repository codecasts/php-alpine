# Alpicetera - Building sandbox image.

# arg for using a specific Alpine version (before FROM)
ARG ALPINE_VERSION

# use alpine version from argument as base/from image.
FROM alpine:$ALPINE_VERSION

# maintainer label.
MAINTAINER Diego Hernandes <iamhernandev@gmail.com>

# declare required build arguments.
ARG ALPINE_VERSION
ARG APK_PACKAGER
ARG APK_MAINTAINER

# make args available as env vars.
ENV ALPINE_VERSION=${ALPINE_VERSION} \
    APK_PACKAGER=${APK_PACKAGER} \
    APK_MAINTAINER=${APK_MAINTAINER} \
    APORTS=/home/sandbox/scripts \
    TERM=xterm-256color \
    COLORTERM=truecolor \
    EDITOR=nano

# install some required tools.
RUN apk add \
    --update-cache \
    alpine-sdk \
    aports-build \
    ncurses \
    sudo \
    bash \
    nano

# configure APK repositories.
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories && \
#     echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories
#     echo "/home/sandbox/packages/php-${PHP_VERSION}" >> /etc/apk/repositories

# add entrypoint script and a cool bashrc.
ADD entrypoint.sh /opt/php-alpine/entrypoint.sh
ADD bashrc /home/sandbox/.bashrc

# ADD THE PUBLIC KEY FOR REPOS.
# COPY ${APK_PUB_KEY} /etc/apk/keys/php-alpine.rsa.pub

# CONFIGURE BUILD.
RUN adduser -D -u 1000 sandbox && \
    addgroup sandbox abuild && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles && \
    chmod +x /opt/php-alpine/entrypoint.sh && \
    mkdir -p /var/cache/apk && \
    ln -s /var/cache/apk /etc/apk/cache && \
    echo "sandbox  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i "/export JOBS=.*/c\export JOBS=$(cat /proc/cpuinfo | grep '^processor\s*:\s[0-9]*$' | wc -l)" /etc/abuild.conf && \
    sed -i "/#USE_CCACHE=.*/c\USE_CCACHE=1" /etc/abuild.conf && \
    sed -i "/#PACKAGER=.*/c\PACKAGER=\"${APK_PACKAGER}\"" /etc/abuild.conf && \
    sed -i "/#MAINTAINER=.*/c\MAINTAINER=\"${APK_MAINTAINER}\"" /etc/abuild.conf && \
    chown -R sandbox:sandbox /home/sandbox

# required for running "aports-build" tool.
RUN mkdir -p /var/run/mqtt-exec.aports-build && \
    chown -R sandbox:abuild /var/run/mqtt-exec.aports-build && \
    chmod 755 /var/run/mqtt-exec.aports-build

# switch to sandbox user.
USER sandbox

# create some required directories.
RUN mkdir -p /home/sandbox/scripts && \
    mkdir -p /home/sandbox/packages

# set entrypoint.
ENTRYPOINT ["/opt/php-alpine/entrypoint.sh"]

# set container workdir.
WORKDIR "/home/sandbox/scripts"

# use bash as default command.
CMD ["/bin/bash"]
