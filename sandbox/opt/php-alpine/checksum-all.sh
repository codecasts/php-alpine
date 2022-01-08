#!/usr/bin/env ash

find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && abuild checksum" \;