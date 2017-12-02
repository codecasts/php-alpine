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

## Available Repositores

| Alpine Version  | PHP Version           | Status                              | Repository URL 
| -               | -                     | -                                   | -
| **`3.7`**       | **`7.2`** _(7.2.0)_   | supported until Alpine 3.9 release  | https://php.codecasts.rocks/v3.7/php-7.2
| **`3.7`**       | **`7.1`** _(7.1.12)_  | supported until Alpine 3.9 release  | https://php.codecasts.rocks/v3.7/php-7.1 
| **`3.6`**       | **`7.2`** _(7.2.0)_   | supported until Alpine 3.8 release  | https://php.codecasts.rocks/v3.6/php-7.2
| **`3.6`**       | **`7.1`** _(7.1.12)_  | supported until Alpine 3.8 release  | https://php.codecasts.rocks/v3.6/php-7.1

> PHP 7.0.x is now deprecated and removed from this documentation. Your scripts will not stop working since the files are still available but they will not be receiving new builds from now on.

---

> Each version is available on a separate repository, choose the one you want and follow the instructions below:

## Snippets

The following code snippets are intended for quick usage on either shell scripts or Dockerfile

### Dockerfile

Notice that `main` and `community` official repositories must be enabled.

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
RUN apk add --update php7@php php7-mbstring@php php7-you-extension-name-here@php
```

You make this repository available in two simple steps:

*Notice:* Be sure to enable `main` and `community` Alpine repositories first.

#### 1) Trusting the repository
```bash
apk add --update curl && curl https://php.codecasts.rocks/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub
```

#### 2) Choosing and Registering the repository on APK

Before registering the repository, make sure you update the example url from the table on this documentation.


```bash
echo "@php http://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories
```

### Usage

For installing PHP and other available extensions you can simply search for the ones you want:

```bash
apk search php7*
```

### Package Conflicts

If official PHP packages conflicts and you endup installing a offical version istead of the ones on this repo, please install packages
by using `@php` at the end of package name.

```
# i.e.
apk add --update php7-redis@php
```


## Available Packages

The following packages are available for installation on both 7.2 and 7.1 repositories:

- **Core Packages (Provide Binaries or Modules)**

`php7` `php7-common` `php7-fpm` `php7-cgi` `php7-apache2`

- **Special Packages (Not needed at runtime)**

`php7-doc` `php7-dev`

- **PHP 7.2 only extensions**

`php7-sodium`

> `libsodium` extension is now part of PHP 7.2, it got renamed to `sodium` only and it reflects the version 2 of the extension.
> The original extension, at version 1 was kept built for PHP 7.2 for legacy purposes, be sure to not install the two extensions together and hope it will work (it actually may but I don't adivise you to try). 

- **Core Extensions**

`php7-bcmath` `php7-bz2` `php7-calendar` `php7-ctype` `php7-curl` `php7-dba` 

`php7-dom` `php7-embed` `php7-enchant` `php7-exif` `php7-ftp` `php7-gd` 

`php7-gettext` `php7-gmp` `php7-iconv` `php7-imap` `php7-intl` `php7-json`

`php7-ldap` `php7-litespeed` `php7-mbstring` `php7-mcrypt` `php7-mysqli`

`php7-mysqlnd` `php7-odbc` `php7-opcache` `php7-openssl` `php7-pcntl`

`php7-pdo` `php7-pdo_dblib` `php7-pdo_mysql` `php7-pdo_pgsql` `php7-pdo_sqlite`

`php7-pear` `php7-pgsql` `php7-phar` `php7-phpdbg` `php7-posix` `php7-pspell`

`php7-session` `php7-shmop` `php7-snmp` `php7-soap` `php7-sockets` `php7-sqlite3`

`php7-sysvmsg` `php7-sysvsem` `php7-sysvshm` `php7-tidy` `php7-wddx` `php7-xml` 

`php7-xmlreader` `php7-xmlrpc` `php7-xsl` `php7-zip` `php7-zlib`
  
- **Additional Extensions**

Some additional PECL extensions are provided so you don't need to build them.

| Extension | Package Name   | Current Version | Available on 7.2 | Available on 7.1 |
|-----------|----------------|-----------------|------------------|------------------|
| APCu      | php7-apcu      | 5.1.8           | Yes              | Yes              |
| Imagick   | php7-imagick   | 3.4.3           | Yes              | Yes              |
| libsodium | php7-libsodium | 1.0.7           | Yes              | Yes              |
| memcached | php7-memcached | 3.0.4           | Yes              | Yes              |
| MongoDB   | php7-mongodb   | 1.3.4           | Yes              | Yes              |
| Redis     | php7-redis     | 3.1.4           | Yes              | Yes              |
| xDebug    | php7-xdebug    | 2.5.5           | `No`             | Yes              |

> **Notifice that xDebug is not yet compatible with PHP 7.2, so the exteion is not yet avaiable but the extension maintainers may release it on the next days**

### Usage on Docker

If you're looking into this, you probably want to create some Rockstar Docker images, right?

Here is a very basic example for installing PHP 7.1:

```dockerfile

FROM alpine:3.7

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN echo "@php http://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories && \
    apk add --update php7@php php7-mbstring@php php7-any-other-extensions-you-may-want@php

```

