# Alpine 3.5 Sandbox Dockerfile
# This image is used to build PHP packages.

# ALPINE 3.5.
FROM alpine:3.5

# ENV FOR PHP VERSION BEING BUILT.
ENV PHP_VERSION="7.0"

# MAINTAINER.
MAINTAINER Diego Hernandes <diego@hernandev.com>

# ADD SDK AND BASIC TOOLS.
RUN apk add --update alpine-sdk sudo git bash nano

# ADD A PLACEHOLDER REPOSITORY CONFIG.
ADD repositories /etc/apk/repositories

# ADD THE START SCRIPT.
ADD start.sh /bin/start.sh

# ADD THE PUBLIC KEY FOR REPOS.
ADD http://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# CONFIGURE BUILD.
RUN adduser -D -u 1000 sandbox && \
    addgroup sandbox abuild && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles && \
    chmod +x /bin/start.sh && \
    echo "sandbox  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i "/#PACKAGER=.*/c\PACKAGER=\"Diego Hernandes <diego@hernandev.com>\"" /etc/abuild.conf && \
    sed -i "/#MAINTAINER=.*/c\MAINTAINER=\"\$PACKAGER\"" /etc/abuild.conf && \
    chown -R sandbox:sandbox /home/sandbox

# REMOVE TEMP FILES.
RUN mkdir -p /var/cache/apk && \
    ln -s /var/cache/apk /etc/apk/cache

# FIX KEY PERMISSION.
RUN chmod u=rw,go=r /etc/apk/keys/php-alpine.rsa.pub

# START ON SANDBOX USER.
USER sandbox

# CONFIGURE ENTRYPOINT.
ENTRYPOINT ["/bin/start.sh"]

# START WITH BASH.
CMD ["/bin/bash"]