#!/usr/bin/env bash

# find inside scripts folder, anything matching php7, remove sub and pkg folders src.
find ./scripts -type d | grep -e 'php7-[a-z]' | xargs -I "{a}" rm -rf  "{a}/src"
find ./scripts -type d | grep -e 'php7-[a-z]' | xargs -I "{a}" rm -rf  "{a}/pkg"