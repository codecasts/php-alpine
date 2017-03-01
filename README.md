# PHP Repository for Alpine

By [CODECASTS](https://codecasts.com.br)

### Important
This repository is based on the work of **[Valery Kartel](https://github.com/vakartel)**. 

The main goal of this repository (both code and packages) is to provide the latest versions of PHP as they are released on http://php.net.

Additionally, we will include extensions many packaged extensions from PECL.

---

### Available PHP Versions

Right now, the following PHP Versions are available:

| Version | Current Patch Version |
|---------|-----------------------|
| 7.1     | 7.1.2                 |
| 7.0     | 7.0.16                |


### Setting UP

For making the repository available on your Alpine install, you need to first
add our public key, so you say APK you trust our packages, and them add the repository:

##### Trusting the repository
```bash
wget -O /etc/apk/keys/diego@hernandev.com-58b4c2e0.rsa.pub http://php-alpine.codecasts.rocks/repo/php-alpine.pub
```

##### Registering the repository on APK

```bash
echo "http://php-alpine.codecasts.rocks/repo" >> /etc/apk/repositories
```

### Usage

For installing PHP and other available extension, you can simply search for the ones you want:

```bash
apk search php7.0*
apk search php7.1*
```

> **Warning: We currently do not enforce replacement between versions, so do not install multiple versions and hope it work**


### Available Packages

All core PHP Extensions are available:

#### PHP 7.1
- php7.1
- php7.1-apache2
- php7.1-bcmath
- php7.1-bz2
- php7.1-calendar
- php7.1-cgi
- php7.1-common
- php7.1-ctype
- php7.1-curl
- php7.1-dba
- php7.1-dev
- php7.1-doc
- php7.1-dom
- php7.1-embed
- php7.1-enchant
- php7.1-exif
- php7.1-fpm
- php7.1-ftp
- php7.1-gd
- php7.1-gettext
- php7.1-gmp
- php7.1-iconv
- php7.1-imap
- php7.1-intl
- php7.1-json
- php7.1-ldap
- php7.1-litespeed
- php7.1-mbstring
- php7.1-mcrypt
- php7.1-mysqli
- php7.1-mysqlnd
- php7.1-odbc
- php7.1-opcache
- php7.1-openssl
- php7.1-pcntl
- php7.1-pdo
- php7.1-pdo_dblib
- php7.1-pdo_mysql
- php7.1-pdo_odbc
- php7.1-pdo_pgsql
- php7.1-pdo_sqlite
- php7.1-pear
- php7.1-pgsql
- php7.1-phar
- php7.1-phpdbg
- php7.1-posix
- php7.1-pspell
- php7.1-session
- php7.1-shmop
- php7.1-snmp
- php7.1-soap
- php7.1-sockets
- php7.1-sqlite3
- php7.1-sysvmsg
- php7.1-sysvsem
- php7.1-sysvshm
- php7.1-tidy
- php7.1-wddx
- php7.1-xml
- php7.1-xmlreader
- php7.1-xmlrpc
- php7.1-xsl
- php7.1-zip
- php7.1-zlib


#### PHP 7.0
- php7.0
- php7.0-apache2
- php7.0-bcmath
- php7.0-bz2
- php7.0-calendar
- php7.0-cgi
- php7.0-common
- php7.0-ctype
- php7.0-curl
- php7.0-dba
- php7.0-dev
- php7.0-doc
- php7.0-dom
- php7.0-embed
- php7.0-enchant
- php7.0-exif
- php7.0-fpm
- php7.0-ftp
- php7.0-gd
- php7.0-gettext
- php7.0-gmp
- php7.0-iconv
- php7.0-imap
- php7.0-intl
- php7.0-json
- php7.0-ldap
- php7.0-litespeed
- php7.0-mbstring
- php7.0-mcrypt
- php7.0-mysqli
- php7.0-mysqlnd
- php7.0-odbc
- php7.0-opcache
- php7.0-openssl
- php7.0-pcntl
- php7.0-pdo
- php7.0-pdo_dblib
- php7.0-pdo_mysql
- php7.0-pdo_odbc
- php7.0-pdo_pgsql
- php7.0-pdo_sqlite
- php7.0-pear
- php7.0-pgsql
- php7.0-phar
- php7.0-phpdbg
- php7.0-posix
- php7.0-pspell
- php7.0-session
- php7.0-shmop
- php7.0-snmp
- php7.0-soap
- php7.0-sockets
- php7.0-sqlite3
- php7.0-sysvmsg
- php7.0-sysvsem
- php7.0-sysvshm
- php7.0-tidy
- php7.0-wddx
- php7.0-xml
- php7.0-xmlreader
- php7.0-xmlrpc
- php7.0-xsl
- php7.0-zip
- php7.0-zlib





#### Additional Extensions

@TBF / Coming Soon