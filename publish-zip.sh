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

CURRENT_TIME=$(date + "%s")

# generate slug. in the "v3.12/php-8.0" format.
REPO_SLUG=v${ALPINE_VERSION}/php-${PHP_VERSION}

# archive name to use.
ARCHIVE_NAME="v${ALPINE_VERSION}-php-${PHP_VERSION}-${CURRENT_TIME}.tar.bz2"

# find all .apk
APK_LIST=$(find "./repo/${REPO_SLUG}" -name "*.apk" -type f | cut -d '/' -f5- | xargs)

# remove archive if exists.
rm "$ARCHIVE_NAME" || echo "no existing ${ARCHIVE_NAME}."

# shellcheck disable=SC2086
tar -cjvf "${ARCHIVE_NAME}" \
  --directory "repo/${REPO_SLUG}/" \
  $APK_LIST x86_64/APKINDEX.tar.gz

# upload after delete.
curl \
    -X PUT \
    -u "${BINTRAY_USERNAME}:${BINTRAY_API_KEY}" \
    -H "X-Bintray-Package: php-${PHP_VERSION}" \
    -H "X-Bintray-Version: ${PHP_MINOR_VERSION}" \
    -H "X-Bintray-Publish: 1" \
    -H "X-Bintray-Override: 1" \
    -H "X-Bintray-Explode: 1" \
    -T "${ARCHIVE_NAME}" \
    "https://api.bintray.com/content/php-alpine/${REPO_SLUG}/"


# upload after delete.
curl \
    -X PUT \
    -u "${BINTRAY_USERNAME}:${BINTRAY_API_KEY}" \
    -H "X-Bintray-Package: php-${PHP_VERSION}" \
    -H "X-Bintray-Version: archives" \
    -H "X-Bintray-Publish: 1" \
    -H "X-Bintray-Override: 1" \
    -H "X-Bintray-Explode: 0" \
    -T "${ARCHIVE_NAME}" \
    "https://api.bintray.com/content/php-alpine/${REPO_SLUG}/"

# remove published archive package.
rm "$ARCHIVE_NAME"
