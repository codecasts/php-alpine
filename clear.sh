#!/usr/bin/env bash

# find inside scripts folder, anything matching php7, remove sub and pkg folders src.
find ./scripts -type d -maxdepth 3 | grep -e 'php-7[0-9]*\.[0-9]*/' | xargs -I "{a}" rm -rf  "{a}/src"
find ./scripts -type d -maxdepth 3 | grep -e 'php-7[0-9]*\.[0-9]*/' | xargs -I "{a}" rm -rf  "{a}/pkg"