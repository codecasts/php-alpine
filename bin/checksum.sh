#!/usr/bin/env bash

# stop on errors.
set -e

# define starting directory.
PA_SOURCES_PATH="${APORTS:-/home/sandbox/scripts}"

# source helpers.
# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}/helpers/colors.sh"

# ensure starts on sources path.
# shellcheck disable=SC2164
cd "${PA_SOURCES_PATH}"

# find all package directories
PACKAGE_DIRS=$(find . -name "APKBUILD" | xargs -I % readlink -f % | xargs -I % dirname %)

# loop packages and build each one.
for PACKAGE_DIR in $PACKAGE_DIRS; do
  cd "${PACKAGE_DIR}" && abuild checksum
done

# echo -e "${PACKAGE_DIRS}"
