#!/bin/sh

# trust the locally mounted public key and fix permissions.
sudo cp /home/sandbox/.abuild/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
sudo chmod u=rw,go=r /etc/apk/keys/php-alpine.rsa.pub

# fix home dir owner permissions.
sudo chown -R sandbox:sandbox /home/sandbox

# determine cpu count.
ABUILD_JOBS=$(grep -c '^processor\s*:\s[0-9]*$' < /proc/cpuinfo)
# configure JOBS variable as cpu count on abuild.conf file.
sudo sed -i "/export JOBS=.*/c\export JOBS=$ABUILD_JOBS" /etc/abuild.conf

# source env files generated during docker build.
if [ -f ~/.build_env ]; then
    # shellcheck disable=SC1090
    . ~/.build_env
fi

# run the original command
exec "$@"
