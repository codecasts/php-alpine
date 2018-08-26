#!/bin/bash


# SUB-PACKAGES TO BUILD
PACKAGES="argon2 secp256k1 php7-apcu php7-imagick php7-libsodium php7-memcached php7-mongodb php7-redis php7-secp256k1 php7-ssh2 php7-xdebug"

# ROOT PATH
ROOT_PATH=$(pwd)

# cd $ROOT_PATH/php7
# abuild -r

for PACKAGE in $PACKAGES; do
    echo "----> Building $PACKAGE"
    sudo apk update
    cd $ROOT_PATH/$PACKAGE
    abuild checksum
    abuild -r
done

# RETURN TO ROOT PATH.
cd $ROOT_PATH
