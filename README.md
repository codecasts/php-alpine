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

| Alpine Version  | PHP Version  | Current Release                                                                                                                                                       | Repository URL                                                                                   |
| -               | -            | -                                                                                                                                                        | -                                                                                                |
| **`3.9`**       | **`7.3`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.9/php-7.3/images/download.svg) ](https://bintray.com/php-alpine/v3.9/php-7.3/_latestVersion) | [https://dl.bintray.com/php-alpine/v3.9/php-7.3](https://dl.bintray.com/php-alpine/v3.9/php-7.3) |
| **`3.8`**       | **`7.3`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.8/php-7.3/images/download.svg) ](https://bintray.com/php-alpine/v3.8/php-7.3/_latestVersion) | [https://dl.bintray.com/php-alpine/v3.8/php-7.3](https://dl.bintray.com/php-alpine/v3.8/php-7.3) |
| **`3.8`**       | **`7.2`**    | [![Download](https://api.bintray.com/packages/php-alpine/v3.8/php-7.2/images/download.svg) ](https://bintray.com/php-alpine/v3.8/php-7.2/_latestVersion) | [https://dl.bintray.com/php-alpine/v3.8/php-7.2](https://dl.bintray.com/php-alpine/v3.8/php-7.2) |

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


## Base Images

If you want, you can use the base images as your starting point on this repository:

The available images are:

| Image Name           | Tag     | FROM Example                       | Description
| -                    | -       | -                                   | -
| codecasts/alpine-3.9 | php-7.3 | `FROM codecasts/alpine-3.9:php-7.3` | PHP 7.3 on Alpine v3.9
| codecasts/alpine-3.8 | php-7.3 | `FROM codecasts/alpine-3.8:php-7.3` | PHP 7.3 on Alpine v3.8
| codecasts/alpine-3.8 | php-7.2 | `FROM codecasts/alpine-3.8:php-7.2` | PHP 7.2 on Alpine v3.8

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
RUN apk --update add ca-certificates

# add the repository, make sure you replace the correct versions if you want.
RUN echo "@php https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories

# install php and some extensions
# notice the @php is required to avoid getting default php packages from alpine instead.
RUN apk add --update php@php
RUN apk add --update php-mbstring@php
RUN apk add --update php-you-extension-name-here@php
```

### Bash / Shell scripting

> You may skip the ca-certificates part if you replace HTTPS by HTTP but you should not. PHP packages will eventually install ca-certificates anyway.


```bash
#!/usr/bin/env sh

# install curl and certificates to download the key
apk add --update curl ca-certificates

# download the repository public key
curl https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub

# add the repository for the php / alpine version corresponding
echo "@php https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories

# install packages
# notice that @php is required so you don't end up with default outdated php packages from community repository.
apk add --update php@php
apk add --update php-redis@php
apk add --update php-any-other-extension@php

```


## Available Packages

This is the complete available packages list:

| Package Name          | Type            | v3.9/php-7.3 | v3.8/php-7.2 | v3.8/php-7.2 |
| - |                   | -               | -            | -            | -            |
| `php`                 | PHP Core        | Yes          | Yes          | Yes          |           
| `php-common`          | PHP Core        | Yes          | Yes          | Yes          |    
| `php-fpm`             | PHP Core        | Yes          | Yes          | Yes          |    
| `php-cgi`             | PHP Core        | Yes          | Yes          | Yes          |    
| `php-apache2`         | PHP Core        | Yes          | Yes          | Yes          |    
| `php-doc`             | PHP Core        | Yes          | Yes          | Yes          |    
| `php-dev`             | PHP Core        | Yes          | Yes          | Yes          |    
|                       |                 |              |              |              |
| `php-sodium`          | Core Extension  | Yes          | Yes          | Yes          |    
| `php-bcmath`          | Core Extension  | Yes          | Yes          | Yes          |    
| `php-bz2`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-calendar`        | Core Extension  | Yes          | Yes          | Yes          |    
| `php-ctype`           | Core Extension  | Yes          | Yes          | Yes          |    
| `php-curl`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-dba`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-dom`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-embed`           | Core Extension  | Yes          | Yes          | Yes          |    
| `php-enchant`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-exif`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-ftp`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-gd`              | Core Extension  | Yes          | Yes          | Yes          |    
| `php-gettext`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-gmp`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-iconv`           | Core Extension  | Yes          | Yes          | Yes          |    
| `php-imap`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-intl`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-json`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-ldap`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-litespeed`       | Core Extension  | Yes          | Yes          | Yes          |    
| `php-mbstring`        | Core Extension  | Yes          | Yes          | Yes          |    
| `php-mcrypt`          | Core Extension  | Yes          | Yes          | Yes          |    
| `php-mysqli`          | Core Extension  | Yes          | Yes          | Yes          |    
| `php-mysqlnd`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-odbc`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-opcache`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-openssl`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pcntl`           | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pdo`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pdo_dblib`       | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pdo_mysql`       | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pdo_pgsql`       | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pdo_sqlite`      | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pear`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pgsql`           | Core Extension  | Yes          | Yes          | Yes          |    
| `php-phar`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-phpdbg`          | Core Extension  | Yes          | Yes          | Yes          |    
| `php-posix`           | Core Extension  | Yes          | Yes          | Yes          |    
| `php-pspell`          | Core Extension  | Yes          | Yes          | Yes          |    
| `php-session`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-shmop`           | Core Extension  | Yes          | Yes          | Yes          |    
| `php-snmp`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-soap`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-sockets`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-sqlite3`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-sysvmsg`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-sysvsem`         | Core Extension  | Yes          | Yes          | Yes          |    
| `php-tidy`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-wddx`            | Core Extension  | Yes          | Yes          | Yes          |    
| `php-xml`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-xmlreader`       | Core Extension  | Yes          | Yes          | Yes          |    
| `php-xmlrpc`          | Core Extension  | Yes          | Yes          | Yes          |    
| `php-xsl`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-zip`             | Core Extension  | Yes          | Yes          | Yes          |    
| `php-zlib`            | Core Extension  | Yes          | Yes          | Yes          |    
|                       |                 |              |              |              |
| `php-amqp`            | Extra Extension | Yes          | Yes          | Yes          |    
| `php-apcu`            | Extra Extension | Yes          | Yes          | Yes          |    
| `php-ast`             | Extra Extension | Yes          | Yes          | Yes          |    
| `php-ds`              | Extra Extension | Yes          | Yes          | Yes          |    
| `php-imagick`         | Extra Extension | Yes          | Yes          | Yes          |    
| `php-mailparse`       | Extra Extension | **No**       | **No**       | Yes          |    
| `php-memcached`       | Extra Extension | Yes          | Yes          | Yes          |    
| `php-mongodb`         | Extra Extension | Yes          | Yes          | Yes          |    
| `php-msgpack`         | Extra Extension | Yes          | Yes          | Yes          |    
| `php-psr`             | Extra Extension | Yes          | Yes          | Yes          |    
| `php-phalcon`         | Extra Extension | Yes          | Yes          | Yes          |    
| `php-redis`           | Extra Extension | Yes          | Yes          | Yes          |    
| `php-ssh2`            | Extra Extension | **No**       | **No**       | Yes          |    
| `php-swoole`          | Extra Extension | Yes          | Yes          | Yes          |    
| `php-timecop`         | Extra Extension | Yes          | Yes          | Yes          |    
| `php-libsodium`       | Extra Extension | Yes          | Yes          | Yes          |    
| `php-scalar_objects`  | Extra Extension | Yes          | Yes          | Yes          |    
| `php-secp256k1`       | Extra Extension | Yes          | Yes          | Yes          |    
| `php-xdebug`          | Extra Extension | Yes          | Yes          | Yes          |
|                       |                 |              |              |              |
| `argon2`              | Extra Package   | Yes          | Yes          | Yes          |      
| `argon2-dev`          | Extra Package   | Yes          | Yes          | Yes          |      
| `libargon2`           | Extra Package   | Yes          | Yes          | Yes          |      
| `secp256k1`           | Extra Package   | Yes          | Yes          | Yes          |
  

> Life's good!
