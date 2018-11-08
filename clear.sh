#!/usr/bin/env bash

# source environment variables for the time being.
source ./.env

# find inside scripts folder, anything matching php7, remove sub folders src.
find ./scripts -type d | grep -e 'php7-[a-z]' | xargs -I "{a}" rm -rf  "{a}/src"