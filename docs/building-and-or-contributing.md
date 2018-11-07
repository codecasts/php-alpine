# PHP-ALPINE - Build & Contribution Guide.

This document includes simple instructions for building the packages at your own and/or locally testing for
contributions on the project.

### Required Tools.

You must have present on the host system:

- docker-compose
- make (GNU make)
- Docker (latest preferable)


### TL;DR

You can browse Makefile scripts to have a general idea of the build process, if you don't want to read this full guide.
Although is very recommended.
 
### Security.

For obvious reasons, the Alpine packaging private key, used to sign packages on this repository
is a secret key known only by the maintainer.

If you intend to build your packages based on this scripts, will will need to generate a new key pair
and the public key from that keypair should be added to alpine.

This section where the public key is added, should be replaced by your own public key path (local paths also works).

```
# USE YOUR OWN PUBLIC KEY ON THIS STEP, OTHERWISE ALPINE WILL NOT TRUST THE PACKAGES YOU BUILT.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
```

Please refer to this documentation in order to generate a signing key pair:
https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package#Setup_your_system_and_account

### Env file.

After generating the signing key, the next step is to configure the environment file.
**Copy the example env file to .env, adjusting the sensitive values.**

The `.env` should look like this:

```
ALPINE_VERSION=3.7
PHP_VERSION=7.2
APK_PACKAGER="Diego Hernandes <diego@hernandev.com>"
APK_MAINTAINER="Diego Hernandes <diego@hernandev.com>"

```

Change Alpine, PHP, packager and maintainer values to the ones you want.

### Building the sandbox.

The sandbox is an special Docker image used for building the packages in an isolated manner.


Build the sandbox with the following command:

```
env $(cat .env) docker-compose build sandbox
```

### Building packages.

To actually build the PHP packages, first we need to enter the sandbox environment:

Run the sandbox with the following command:
```
env $(cat .env) docker-compose run sandbox bash
```

After entering the sandbox, you will notice two folders on `/home/sandbox`:

- /home/sandbox/php-x.x
    This one is the actual scripts folder, all scripts are inside.

- /home/sandbox/repositories
    This folder will contain the built packages.

Enter a given package you want to build and run:

- Verify sources integrity:

```
abuild checksum
```

- Actually build the package:

```
abuild -r
```