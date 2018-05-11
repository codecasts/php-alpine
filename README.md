# PHP Repositories for Alpine - by CODECASTS

**"Up-to-date, PHP packages for Alpine Linux."**

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

| Alpine Version  | PHP Version             | Status                               | Repository URL 
| -               | -                       | -                                    | -
| **`3.7`**       | **`7.2`** / `7.2.3`     | supported until Alpine v3.9 release  | [https://php.codecasts.rocks/v3.7/php-7.2](https://php.codecasts.rocks/v3.7/php-7.2)
| **`3.7`**       | **`7.1`** / `7.1.15`    | supported until Alpine v3.9 release  | [https://php.codecasts.rocks/v3.7/php-7.1](https://php.codecasts.rocks/v3.7/php-7.1) 
| **`3.6`**       | **`7.2`** / `7.2.3`     | supported until Alpine v3.8 release  | [https://php.codecasts.rocks/v3.6/php-7.2](https://php.codecasts.rocks/v3.6/php-7.2)
| **`3.6`**       | **`7.1`** / `7.1.15`    | supported until Alpine v3.8 release  | [https://php.codecasts.rocks/v3.6/php-7.1](https://php.codecasts.rocks/v3.6/php-7.1)

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
| codecasts/alpine-3.7 | php-7.2 | `FROM codecasts/alpine-3.7:php-7.2` | PHP 7.2 on Alpine v3.7 
| codecasts/alpine-3.7 | php-7.1 | `FROM codecasts/alpine-3.7:php-7.1` | PHP 7.1 on Alpine v3.7 
| codecasts/alpine-3.6 | php-7.2 | `FROM codecasts/alpine-3.6:php-7.2` | PHP 7.2 on Alpine v3.6 
| codecasts/alpine-3.6 | php-7.1 | `FROM codecasts/alpine-3.6:php-7.1` | PHP 7.1 on Alpine v3.6

## Snippets

The following code snippets are intended for quick usage on either shell scripts or Dockerfile

> Notice that `main` and `community` official repositories must be enabled.

### Dockerfile

You may skip the ca-certificates part if you replace HTTPS by HTTP but you should not. PHP packages will eventually install ca-certificates anyway.

```dockerfile
# change to Alpine 3.6 you like.
FROM alpine:3.7

# trust this project public key to trust the packages.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

## you may join the multiple run lines here to make it a single layer

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# add the repository, make sure you replace the correct versions if you want.
RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

# install php and some extensions
# notice the @php is required to avoid getting default php packages from alpine instead.
RUN apk add --update php@php
RUN apk add --update php-mbstring@php
RUN apk add --update php-you-extension-name-here@php
```

### Bash / Shell scripting

> You may skil the ca-certificates part if you replace HTTPS by HTTP but you should not. PHP packages will eventually install ca-certificates anyway.


```bash
#!/usr/bin/env sh

# install curl and certificates to download the key
apk add --update curl ca-certificates

# download the repository public key
curl https://php.codecasts.rocks/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub

# add the repository for the php / alpine version corresponding
echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

# install packages
# notice that @php is required so you don't end up with default outdated php packages from community repository.
apk add --update php@php
apk add --update php-redis@php
apk add --update php-any-other-extension@php

```


## Available Packages

The following packages are available for installation on both 7.2 and 7.1 repositories:

- **[NEW]** **Backported Packages**

`argon2` `argon2-dev` `libargon2`

Argon2 was backported from EDGE branch of `ports` to allow PHP to be compiled with Argon2 password hashing support.

- **Core Packages (Provide Binaries or Modules)**

`php` `php-common` `php-fpm` `php-cgi` `php-apache2`

- **Special Packages (Not needed at runtime)**

`php-doc` `php-dev`

- **PHP 7.2 only extensions**

`php-sodium`

> `libsodium` extension is now part of PHP 7.2, it got renamed to `sodium` only and it reflects the version 2 of the extension.
> The original extension, at version 1 was kept built for PHP 7.2 for legacy purposes, be sure to not install the two extensions together and hope it will work (it actually may but I don't adivise you to try). 

- **Core Extensions**


`php-bcmath` `php-bz2` `php-calendar` `php-ctype` `php-curl` `php-dba` 

`php-dom` `php-embed` `php-enchant` `php-exif` `php-ftp` `php-gd` 

`php-gettext` `php-gmp` `php-iconv` `php-imap` `php-intl` `php-json`

`php-ldap` `php-litespeed` `php-mbstring` `php-mcrypt` `php-mysqli`

`php-mysqlnd` `php-odbc` `php-opcache` `php-openssl` `php-pcntl`

`php-pdo` `php-pdo_dblib` `php-pdo_mysql` `php-pdo_pgsql` `php-pdo_sqlite`

`php-pear` `php-pgsql` `php-phar` `php-phpdbg` `php-posix` `php-pspell`

`php-session` `php-shmop` `php-snmp` `php-soap` `php-sockets` `php-sqlite3`

`php-sysvmsg` `php-sysvsem` `php-sysvshm` `php-tidy` `php-wddx` `php-xml` 

`php-xmlreader` `php-xmlrpc` `php-xsl` `php-zip` `php-zlib`
  
- **Additional Extensions**

Some additional PECL extensions are provided so you don't need to build them.

| Extension                | Package Name   | Current Version | Available on 7.2 | Available on 7.1 |
|--------------------------|----------------|-----------------|------------------|------------------|
| APCu                     | php-apcu      | 5.1.11          | Yes              | Yes              |
| Imagick                  | php-imagick   | 3.4.3           | Yes              | Yes              |
| libsodium _(legacy v1)_  | php-libsodium | 1.0.7           | Yes              | Yes              |
| mailparse                | php-mailparse | 3.0.2           | Yes              | Yes              |
| memcached                | php-memcached | 3.0.4           | Yes              | Yes              |
| MongoDB                  | php-mongodb   | 1.4.2           | Yes              | Yes              |
| Redis                    | php-redis     | 3.1.6           | Yes              | Yes              |
| SSH2                     | php-ssh2      | 1.1.2           | Yes              | Yes              |
| xDebug                   | php-xdebug    | 2.6.0           | Yes              | Yes              |

Non PECL extensions included:

| Extension | Package Name  | Current Version | Available on 7.2 | Available on 7.1 |
| -         | -             | -               | -                | -                |
| secp256k1 | php-secp256k1 | 0.1.3           | Yes              | Yes              | 

## Enjoy Life
