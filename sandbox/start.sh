#!/usr/bin/env bash

# trust the locally mounted public key.
sudo cp /home/sandbox/.abuild/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# fix key permission.
sudo chmod u=rw,go=r /etc/apk/keys/php-alpine.rsa.pub

# fix owner permissions.
sudo chown -R sandbox:sandbox /home/sandbox


# run the original command
exec "$@"

## DECLARE ALPINE VERSION TO START.
#ALPINE_VERSION=$1
#
## DECLARE PHP VERSION TO START.
#PHP_VERSION=$2
#
## ENSURE DIRECTORY EXISTS.
#mkdir -p $(pwd)/.abuild
#mkdir -p $(pwd)/repo/$ALPINE_VERSION/$PHP_VERSION
#
## START SANDBOX CONTAINER.
#docker run -it --rm \
#    --init \
#    -e PHP_VERSION=$PHP_VERSION \
#    -v $(pwd)/scripts/$ALPINE_VERSION/$PHP_VERSION:/home/sandbox/$PHP_VERSION \
#    -v $(pwd)/.abuild:/home/sandbox/.abuild \
#    -v $(pwd)/repo/$ALPINE_VERSION/$PHP_VERSION:/home/sandbox/packages/$PHP_VERSION \
#    -v $(pwd)/cache/$ALPINE_VERSION:/var/cache/apk \
#    codecasts/php-alpine:$ALPINE_VERSION