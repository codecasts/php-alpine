#!/usr/bin/env bash

# function for building packages.
function build_package()
{
    # alias package name from function input.
    PACKAGE_NAME=${1}

    # enter package source directory.
    # shellcheck disable=SC2164
    cd "$PA_SOURCES_PATH/$PACKAGE_NAME"

    # give a little feedback about the current package being built.
    success "building:" "$PACKAGE_NAME"

    # build the package from source.
    if [ "$PA_BUILD_CHECKSUM" = true ]; then
      abuild checksum
    fi

    # build the package from source.
    if [ "$PA_BUILD_BUILD" = true ]; then
      abuild -r
    fi

    # return shell to previous location for safe scripting!
    # shellcheck disable=SC2164
    cd "${PA_SOURCES_PATH}"
}

# build all packages in a given list.
function build_list()
{
  # define build list variable.
  BUILD_PACKAGE_LIST=$*

  # verbose.
  success "building list:" "$BUILD_PACKAGE_LIST"

  # loop packages and build each one.
  for PACKAGE in $BUILD_PACKAGE_LIST; do
    build_package "$PACKAGE"
  done
}
