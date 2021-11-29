# export php package name.
export PA_PHP_MAIN="php8"

# dependencies to build.
export PA_PHP_EXTRA="argon2 enchant secp256k1"

# extensions to build.
export PA_PHP_EXTENSIONS="
  apcu
  hashids
  imagick
  libsodium
  memcached
  mongodb
  msgpack
  psr
  redis
  scalar_objects
  swoole
  xdebug
"
