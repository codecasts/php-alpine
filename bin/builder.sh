#!/usr/bin/env bash

# stop on errors.
set -e

# define starting directory.
PA_SOURCES_PATH=$(pwd)

# load variables from scripts config.
# shellcheck disable=SC1090
source "${PA_SOURCES_PATH}/config.sh"

# source helpers.
# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}/helpers/colors.sh"
# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}/helpers/prepare.sh"
# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}/helpers/flags.sh"
# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}/helpers/build.sh"

# ensure starts on sources path.
# shellcheck disable=SC2164
cd "${PA_SOURCES_PATH}"

# update repositories first.
sudo apk update

# run for extra packages.
if [ "$PA_BUILD_EXTRA" = true ]; then
  # verbose.
  information "running tasks for:" "extra packages."
  # loop and build packages.
  build_list "${PA_PHP_EXTRA}";
else
  warning "skipping:" "extra packages."
fi

# # run for main php package.
if [ "$PA_BUILD_MAIN" = true ]; then
  # verbose.
  information "running tasks for:" "main (php)."
  # update apk so extra packages are available.
  sudo apk update
  # build package.
  build_package "${PA_PHP_MAIN}"
else
  warning "skipping:" "main (php)."
fi

# run for extensions.
if [ "$PA_BUILD_EXTENSIONS" = true ]; then
  # verbose.
  information "running tasks for:" "extensions."
  # update apk so main & extra packages are available.
  sudo apk update
  # loop and build packages.
  build_list "${PA_PHP_EXTENSIONS_PREFIXED}";
else
  warning "skipping:" "extensions."
fi

# ensure the final destination is the sources path.
# shellcheck disable=SC2164
cd "$PA_SOURCES_PATH"
