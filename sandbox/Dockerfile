# Sandbox for building PHP Images for Alpine

# use alpine 3.5
FROM alpine:3.5

# Projects's maintainer
MAINTAINER Diego Hernandes <diego@hernandev.com>

RUN apk add --update alpine-sdk sudo git bash nano
RUN adduser -D -u 1000 sandbox && \
    addgroup sandbox abuild && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles && \
    echo "sandbox  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i "/#PACKAGER=.*/c\PACKAGER=\"Diego Hernandes <diego@hernandev.com>\"" /etc/abuild.conf && \
    sed -i "/#MAINTAINER=.*/c\MAINTAINER=\"\$PACKAGER\"" /etc/abuild.conf && \
    wget -O /tini https://github.com/krallin/tini/releases/download/v0.14.0/tini-static && \
    chmod +x /tini && \
    chown -R sandbox:sandbox /home/sandbox

RUN mkdir -p /var/cache/apk && \
    ln -s /var/cache/apk /etc/apk/cache

USER sandbox

ENTRYPOINT ["/tini", "--"]

CMD ["/bin/bash"]


