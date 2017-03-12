# PHP Repositories for Alpine

By [CODECASTS](https://codecasts.com.br) - **Based on the work of [Valery Kartel](https://github.com/vakartel)**

---
The main goal of this repository (both code and packages) is to provide the latest versions of PHP as they are released on http://php.net.

Additionally, we will include extensions many packaged extensions from PECL.

---

## Available PHP Versions

Right now, the following PHP Versions are available:

| Version | Current Patch Version | Repository URL  |
|---------|-----------------------|-----------------|
| 7.1     | 7.1.2                 | http://php.codecasts.rocks/7.1 |
| 7.0     | 7.0.16                | http://php.codecasts.rocks/7.0 |

> Each version is available on a separate repository, choose the one you want on the instruction below

## Setting UP

You make make this repositories available on two simple steps:

#### 1) Trusting the repository
```bash
wget -O /etc/apk/keys/diego@hernandev.com-58b4c2e0.rsa.pub http://php.codecasts.rocks/php-alpine.pub
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

For installing PHP and other available extension, you can simply search for the ones you want:

```bash
apk search php7*
```


## Available Packages

The following packages are available for install, on both 7.0 and 7.1 repositories:

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

This section will keep being updated as more extension are added.

`php7-apcu` `php7-imagick` `php7-libsodium` `php7-memcached`
`php7-mongodb` `php7-redis` `php7-xdebug`


### Usage on Docker

If you're looking into this, you probably want to create some Rockstar Docker images right?

Here is a very basic example for installing PHP 7.1:

```dockerfile

FROM alpine:3.5

RUN wget -O /etc/apk/keys/diego@hernandev.com-58b4c2e0.rsa.pub \
    http://php.codecasts.rocks/php-alpine.pub && \
    echo "http://php.codecasts.rocks/7.1" >> /etc/apk/repositories && \
    apk add --update php7 php7-mbstring php7-any-other-extensions-you-may-want

```

