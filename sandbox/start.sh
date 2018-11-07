#!/usr/bin/env bash

# trust the locally mounted public key.
sudo cp /home/sandbox/.abuild/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# fix key permission.
sudo chmod u=rw,go=r /etc/apk/keys/php-alpine.rsa.pub

# fix owner permissions.
sudo chown -R sandbox:sandbox /home/sandbox

# source env files generated during docker build.
if [ -f ~/.build_env ]; then
    . ~/.build_env
fi

# run the original command
exec "$@"
