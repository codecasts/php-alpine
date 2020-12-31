#!/usr/bin/env bash

# fix all packages permissions.
sudo chown -R sandbox:sandbox "$HOME"/packages || echo -e ""
# fix all packages ownership.
sudo chmod -R 644 "$HOME"/packages/*/*/*.{apk,tar.gz} || echo -e ""
# list cached packages.
ls -lhart "$HOME"/packages/*/*/*.{apk,tar.gz} || echo -e ""
