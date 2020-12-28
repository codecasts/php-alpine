#!/usr/bin/env bash

# failsafe $PACKAGES and $EXTENSIONS variables.
PA_PHP_EXTRA=${PA_PHP_EXTRA:-""}
PA_PHP_MAIN=${PA_PHP_MAIN:-""}
PA_PHP_EXTENSIONS=${PA_PHP_EXTENSIONS:-""}

# define prefixed version of extensions list, start empty.
PA_PHP_EXTENSIONS_PREFIXED=""

# loop extensions.
for PA_EXT_NAME in $PA_PHP_EXTENSIONS; do
  PA_PHP_EXTENSIONS_PREFIXED="$PA_PHP_EXTENSIONS_PREFIXED ${PA_PHP_MAIN}-${PA_EXT_NAME}"
done
