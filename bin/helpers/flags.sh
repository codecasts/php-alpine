#!/usr/bin/env bash

# alias build options.
PA_BUILD_OPTIONS=$*

# flags for package groups to build.
PA_BUILD_EXTRA=false
PA_BUILD_MAIN=false
PA_BUILD_EXTENSIONS=false
# actually build packages.
PA_BUILD_BUILD=false
# run checksum first.
PA_BUILD_CHECKSUM=false

# check for --full flag.
if [[ "$PA_BUILD_OPTIONS" == *"--full"* ]]; then
  PA_BUILD_EXTRA=true
  PA_BUILD_MAIN=true
  PA_BUILD_EXTENSIONS=true
fi

# check for --no-update flag.
if [[ "$PA_BUILD_OPTIONS" == *"--no-update"* ]]; then
  # shellcheck disable=SC2034
  PA_BUILD_UPDATE=false
fi

# check for --build flag.
if [[ "$PA_BUILD_OPTIONS" == *"--build"* ]]; then
  # shellcheck disable=SC2034
  PA_BUILD_BUILD=true
fi

# check for --checksum flag.
if [[ "$PA_BUILD_OPTIONS" == *"--checksum"* ]]; then
  # shellcheck disable=SC2034
  PA_BUILD_CHECKSUM=true
fi

# check for --dep
if [[ "$PA_BUILD_OPTIONS" == *"--extra"* ]]; then
  # shellcheck disable=SC2034
  PA_BUILD_EXTRA=true
fi
# check for --php flag.
if [[ "$PA_BUILD_OPTIONS" == *"--main"* ]]; then
  # shellcheck disable=SC2034
  PA_BUILD_MAIN=true
fi
# check for --ext flag.
if [[ "$PA_BUILD_OPTIONS" == *"--extensions"* ]]; then
  # shellcheck disable=SC2034
  PA_BUILD_EXTENSIONS=true
fi
