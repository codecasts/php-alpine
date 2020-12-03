#!/usr/bin/env bash

# bash mode.
set -e;

# source environment variables for the time being.
source ./.env

# ensure variables exists from .env.
ALPINE_VERSION=${ALPINE_VERSION}
PHP_VERSION=${PHP_VERSION}
PHP_MINOR_VERSION=${PHP_MINOR_VERSION}
BINTRAY_USERNAME=${BINTRAY_USERNAME}
BINTRAY_API_KEY=${BINTRAY_API_KEY}

# get timestamp to use as repo tag.
INTERNAL_VERSION=${PHP_MINOR_VERSION}

# get all files for a given repo.
PACKAGES=$(find "./repo/v${ALPINE_VERSION}/php-${PHP_VERSION}" -type f | cut -d '/' -f6- | xargs)

# loop each file.
for FILENAME in ${PACKAGES}; do
    # say with file is being uploaded.
    echo -e "\nUploading file ${FILENAME}"
    # base package slug is on the format "v3.x/php-x.x"
    BASE_PACKAGE_SLUG=v${ALPINE_VERSION}/php-${PHP_VERSION}
    # endpoint name.
    ENDPOINT=https://api.bintray.com/content/php-alpine/${BASE_PACKAGE_SLUG}/${INTERNAL_VERSION}/php-${PHP_VERSION}

    # delete first.
    curl -X DELETE -u ${BINTRAY_USERNAME}:${BINTRAY_API_KEY} https://api.bintray.com/content/php-alpine/${BASE_PACKAGE_SLUG}/x86_64/${FILENAME}

    # upload after delete.
    curl -X PUT -u ${BINTRAY_USERNAME}:${BINTRAY_API_KEY} \
        -H "X-Bintray-Package: php-${PHP_VERSION}" \
        -H "X-Bintray-Version: ${INTERNAL_VERSION}" \
        -H "X-Bintray-Publish: 1" \
        -H "X-Bintray-Override: 1" \
        -T ./repo/${BASE_PACKAGE_SLUG}/x86_64/${FILENAME}  \
        https://api.bintray.com/content/php-alpine/${BASE_PACKAGE_SLUG}/x86_64/${FILENAME}
        # "${ENDPOINT}/x86_64/${FILENAME}"
done
