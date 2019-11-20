#!/usr/bin/env bash

# find inside scripts folder, anything matching php7, remove sub and pkg folders src.
find ./scripts -maxdepth 3 -type d | grep -e 'php-7[0-9]*\.[0-9]*/' | xargs -I "{a}" rm -rf  "{a}/src"
find ./scripts -maxdepth 3 -type d  | grep -e 'php-7[0-9]*\.[0-9]*/' | xargs -I "{a}" rm -rf  "{a}/pkg"
