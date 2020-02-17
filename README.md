# PHP Repositories for Alpine - by CODECASTS

**"Maybe Up-to-date, PHP packages for Alpine Linux."**

---

Maintained by **[@hernandev](https://github.com/hernandev)**. Based on **[Valery Kartel](https://github.com/vakartel)** scripts.

---

This project provides a simple alternative for running updated PHP on Alpine Linux.

We pack and release PHP versions as soon they are available on http://php.net. (At least, we try to.)

Additionally, many PECL extensions are also available as packages as well.

---

## Release Cycle

For short, this project will support **2 minor version of both PHP and Alpine**  at time.

## Available Repositories

| Alpine Version  | PHP Version  | Current Release                                                                                                                                            | Repository URL                                                                                     |
| -               | -            | -                                                                                                                                                          | -                                                                                                  |
| **`3.10`**      | **`7.4`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.10/php-7.4/images/download.svg) ](https://bintray.com/php-alpine/v3.10/php-7.4/_latestVersion) | [https://dl.bintray.com/php-alpine/v3.10/php-7.4](https://dl.bintray.com/php-alpine/v3.10/php-7.4) |
| **`3.9`**       | **`7.4`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.9/php-7.4/images/download.svg) ](https://bintray.com/php-alpine/v3.9/php-7.4/_latestVersion)   | [https://dl.bintray.com/php-alpine/v3.9/php-7.4](https://dl.bintray.com/php-alpine/v3.9/php-7.4)   |
| **`3.9`**       | **`7.3`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.9/php-7.3/images/download.svg) ](https://bintray.com/php-alpine/v3.9/php-7.3/_latestVersion)   | [https://dl.bintray.com/php-alpine/v3.9/php-7.3](https://dl.bintray.com/php-alpine/v3.9/php-7.3)   |
| **`3.8`**       | **`7.3`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.8/php-7.3/images/download.svg) ](https://bintray.com/php-alpine/v3.8/php-7.3/_latestVersion)   | [https://dl.bintray.com/php-alpine/v3.8/php-7.3](https://dl.bintray.com/php-alpine/v3.8/php-7.3)   |
| **`3.8`**       | **`7.2`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.8/php-7.2/images/download.svg) ](https://bintray.com/php-alpine/v3.8/php-7.2/_latestVersion)   | [https://dl.bintray.com/php-alpine/v3.8/php-7.2](https://dl.bintray.com/php-alpine/v3.8/php-7.2)   |

> Alpine v3.7 is now deprecated and removed from this documentation. Your scripts will not stop working since the files are still available but they will not be receiving new builds from now on.
> PHP 7.1.x is now deprecated and removed from this documentation. Your scripts will not stop working since the files are still available but they will not be receiving new builds from now on.
> PHP 7.0.x is now deprecated and removed from this documentation. Your scripts will not stop working since the files are still available but they will not be receiving new builds from now on.

---

> Each version is available on a separate repository, choose the one you want and follow the instructions below:

## Repository Conflicts

In some cases, the packages on the repositories may present conflicts with official packages.

To solve that, each page was aliases as `php-name`, without the `7` indicator.

Considering this, all installs are now encouraged to reference the virtual names when installing.

The examples on this documentation are now updated to reflect this decision.

The original names are kept, and it should not break working scripts.

## Snippets

The following code snippets are intended for quick usage on either shell scripts or Dockerfile

> Notice that `main` and `community` official repositories must be enabled.

### Dockerfile

You may skip the ca-certificates part if you replace HTTPS by HTTP but you should not. PHP packages will eventually install ca-certificates anyway.

```dockerfile
# Versions 3.8 and 3.7 are current stable supported versions.
FROM alpine:3.9

# trust this project public key to trust the packages.
ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

## you may join the multiple run lines here to make it a single layer

# make sure you can use HTTPS
RUN apk --update-cache add ca-certificates

# add the repository, make sure you replace the correct versions if you want.
RUN echo "https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories

# install php and some extensions
RUN apk add --update-cache php
RUN apk add --update-cache php-mbstring
RUN apk add --update-cache php-you-extension-name-here
```

### Bash / Shell scripting

> You may skip the ca-certificates part if you replace HTTPS by HTTP but you should not. PHP packages will eventually install ca-certificates anyway.


```bash
#!/usr/bin/env sh

# install curl and certificates to download the key
apk add --update-cache curl ca-certificates

# download the repository public key
curl https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub

# add the repository for the php / alpine version corresponding
echo "https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories

# install packages
apk add --update-cache php
apk add --update-cache php-redis
apk add --update-cache php-any-other-extension

```


## Available Packages

This is the complete available packages list:

| Package Name          | Type            |
| -                     | -               |
| `php`                 | PHP Core        |
| `php-common`          | PHP Core        |
| `php-fpm`             | PHP Core        |
| `php-cgi`             | PHP Core        |
| `php-apache2`         | PHP Core        |
| `php-doc`             | PHP Core        |
| `php-dev`             | PHP Core        |
|  -                    |                 |
| `php-sodium`          | Core Extension  |
| `php-bcmath`          | Core Extension  |
| `php-bz2`             | Core Extension  |
| `php-calendar`        | Core Extension  |
| `php-ctype`           | Core Extension  |
| `php-curl`            | Core Extension  |
| `php-dba`             | Core Extension  |
| `php-dom`             | Core Extension  |
| `php-embed`           | Core Extension  |
| `php-enchant`         | Core Extension  |
| `php-exif`            | Core Extension  |
| `php-ftp`             | Core Extension  |
| `php-gd`              | Core Extension  |
| `php-gettext`         | Core Extension  |
| `php-gmp`             | Core Extension  |
| `php-iconv`           | Core Extension  |
| `php-imap`            | Core Extension  |
| `php-intl`            | Core Extension  |
| `php-json`            | Core Extension  |
| `php-ldap`            | Core Extension  |
| `php-litespeed`       | Core Extension  |
| `php-mbstring`        | Core Extension  |
| `php-mcrypt`          | Core Extension  |
| `php-mysqli`          | Core Extension  |
| `php-mysqlnd`         | Core Extension  |
| `php-odbc`            | Core Extension  |
| `php-opcache`         | Core Extension  |
| `php-openssl`         | Core Extension  |
| `php-pcntl`           | Core Extension  |
| `php-pdo`             | Core Extension  |
| `php-pdo_dblib`       | Core Extension  |
| `php-pdo_mysql`       | Core Extension  |
| `php-pdo_pgsql`       | Core Extension  |
| `php-pdo_sqlite`      | Core Extension  |
| `php-pear`            | Core Extension  |
| `php-pgsql`           | Core Extension  |
| `php-phar`            | Core Extension  |
| `php-phpdbg`          | Core Extension  |
| `php-posix`           | Core Extension  |
| `php-pspell`          | Core Extension  |
| `php-session`         | Core Extension  |
| `php-shmop`           | Core Extension  |
| `php-snmp`            | Core Extension  |
| `php-soap`            | Core Extension  |
| `php-sockets`         | Core Extension  |
| `php-sqlite3`         | Core Extension  |
| `php-sysvmsg`         | Core Extension  |
| `php-sysvsem`         | Core Extension  |
| `php-tidy`            | Core Extension  |
| `php-wddx`            | Core Extension  |
| `php-xml`             | Core Extension  |
| `php-xmlreader`       | Core Extension  |
| `php-xmlrpc`          | Core Extension  |
| `php-xsl`             | Core Extension  |
| `php-zip`             | Core Extension  |
| `php-zlib`            | Core Extension  |
|  -                    |                 |
| `php-amqp`            | Extra Extension |
| `php-apcu`            | Extra Extension |
| `php-ast`             | Extra Extension |
| `php-ds`              | Extra Extension |
| `php-imagick`         | Extra Extension |
| `php-mailparse`       | Extra Extension |
| `php-memcached`       | Extra Extension |
| `php-mongodb`         | Extra Extension |
| `php-msgpack`         | Extra Extension |
| `php-psr`             | Extra Extension |
| `php-phalcon`         | Extra Extension |
| `php-redis`           | Extra Extension |
| `php-ssh2`            | Extra Extension |
| `php-swoole`          | Extra Extension |
| `php-timecop`         | Extra Extension |
| `php-libsodium`       | Extra Extension |
| `php-scalar_objects`  | Extra Extension |
| `php-secp256k1`       | Extra Extension |
| `php-xdebug`          | Extra Extension |
|  -                    |                 |
| `argon2`              | Extra Package   |
| `argon2-dev`          | Extra Package   |
| `libargon2`           | Extra Package   |
| `secp256k1`           | Extra Package   |


> Life's good!
