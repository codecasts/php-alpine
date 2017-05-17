# PHP Repositories for Alpine

By [CODECASTS](https://codecasts.com.br) - **Based on the work of [Valery Kartel](https://github.com/vakartel)**

---
The main goal of this repository (both code and packages) is to provide the latest versions of PHP as they are released on http://php.net.

Additionally, we will include many packaged extensions from PECL.

---

## Available PHP Versions

Right now, the following PHP Versions are available:

| Version | Current Patch Version | Repository URL                 |
|---------|-----------------------|--------------------------------|
| 7.1     | 7.1.5                 | http://php.codecasts.rocks/7.1 |
| 7.0     | 7.0.18                | http://php.codecasts.rocks/7.0 |

> Each version is available on a separate repository, choose the one you want and follow the instructions below:

## Setting UP

You make this repository available in two simple steps:

*Notice:* Be sure to enable `main` and `community` Alpine repositories first.

#### 1) Trusting the repository
```bash
wget -O /etc/apk/keys/php-alpine.rsa.pub http://php.codecasts.rocks/php-alpine.rsa.pub
```

#### 2) Choosing and Registering the repository on APK

Before registering the repository, you should choose which version of PHP you want.

For PHP 7.0:

```bash
echo "http://php.codecasts.rocks/7.0" >> /etc/apk/repositories
```

For PHP 7.1:

```bash
echo "http://php.codecasts.rocks/7.1" >> /etc/apk/repositories
```

### Usage

For installing PHP and other available extensions you can simply search for the ones you want:

```bash
apk search php7*
```


## Available Packages

The following packages are available for installation on both 7.0 and 7.1 repositories:

- **Core Packages (Provide Binaries or Modules)**

`php7` `php7-common` `php7-fpm` `php7-cgi` `php7-apache2`

- **Special Packages (Not needed at runtime)**

`php7-doc` `php7-dev`

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

| Extension | Package Name   | Current Version | Available on 7.0 | Available on 7.1 |
|-----------|----------------|-----------------|------------------|------------------|
| APCu      | php7-apcu      | 5.1.8           | Yes              | Yes              |
| Imagick   | php7-imagick   | 3.4.3           | Yes              | Yes              |
| libsodium | php7-libsodium | 1.0.6           | Yes              | Yes              |
| memcached | php7-memcached | 3.0.3           | Yes              | Yes              |
| MongoDB   | php7-mongodb   | 1.2.8           | Yes              | Yes              |
| Redis     | php7-redis     | 3.1.2           | Yes              | Yes              |
| xDebug    | php7-xdebug    | 2.5.3           | Yes              | Yes              |

### Usage on Docker

If you're looking into this, you probably want to create some Rockstar Docker images, right?

Here is a very basic example for installing PHP 7.1:

```dockerfile

FROM alpine:3.5

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN echo "http://php.codecasts.rocks/7.1" >> /etc/apk/repositories && \
    apk add --update php7 php7-mbstring php7-any-other-extensions-you-may-want

```

