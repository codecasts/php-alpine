# Alpine 3.x Sandbox Dockerfile
# This image is used to build PHP packages.

# IMAGE ARGUMENT
ARG ALPINE_VERSION

# ALPINE 3.x.
FROM alpine:$ALPINE_VERSION

# MAINTAINER.
MAINTAINER Diego Hernandes <iamhernandev@gmail.com>

# AFTER IMAGE DEFINITION ARGUMENTS
ARG ALPINE_VERSION
ARG PHP_VERSION
ARG APK_PACKAGER
ARG APK_MAINTAINER

# ADD SDK AND BASIC TOOLS.
RUN apk add --update alpine-sdk sudo git bash nano

# CONFIGURE ALPINE REPOSITORIES AND PHP BUILD DIR.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories && \
    echo "/home/sandbox/packages/php-${PHP_VERSION}" >> /etc/apk/repositories

# ADD THE START SCRIPT.
ADD start.sh /bin/start.sh
ADD bashrc /home/sandbox/.bashrc

# ADD THE PUBLIC KEY FOR REPOS.
# COPY ${APK_PUB_KEY} /etc/apk/keys/php-alpine.rsa.pub

# CONFIGURE BUILD.
RUN adduser -D -u 1000 sandbox && \
    addgroup sandbox abuild && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles && \
    chmod +x /bin/start.sh && \
    echo "sandbox  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i "/#PACKAGER=.*/c\PACKAGER=\"${APK_PACKAGER}\"" /etc/abuild.conf && \
    sed -i "/#MAINTAINER=.*/c\MAINTAINER=\"${APK_MAINTAINER}\"" /etc/abuild.conf && \
    chown -R sandbox:sandbox /home/sandbox

# generate build env vars.
RUN echo "ALPINE_VERSION=${ALPINE_VERSION}" >> /home/sandbox/.build_env && \
    echo "PHP_VERSION=${PHP_VERSION}" >> /home/sandbox/.build_env && \
    echo "APK_PACKAGER=${APK_PACKAGER}" >> /home/sandbox/.build_env && \
    echo "APK_MAINTAINER=${APK_MAINTAINER}" >> /home/sandbox/.build_env

# REMOVE TEMP FILES.
RUN mkdir -p /var/cache/apk && \
    ln -s /var/cache/apk /etc/apk/cache

# FIX KEY PERMISSION.
# RUN chmod u=rw,go=r /etc/apk/keys/php-alpine.rsa.pub

# START ON SANDBOX USER.
USER sandbox

# CONFIGURE ENTRYPOINT.
ENTRYPOINT ["/bin/start.sh"]

# START ON SANDBOX USER HOME.
WORKDIR "/home/sandbox/php-${PHP_VERSION}"

# START WITH BASH.
CMD ["/bin/bash"]