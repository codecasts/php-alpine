# export php package name.
export PA_PHP_MAIN="php7"

# dependencies to build.
export PA_PHP_EXTRA="argon2 enchant secp256k1"

# extensions to build.
export PA_PHP_EXTENSIONS="
  amqp
  apcu
  ast
  ds
  hashids
  imagick
  libsodium
  memcached
  mongodb
  msgpack
  psr
  redis
  scalar_objects
  secp256k1
  swoole
  timecop
  xdebug
"
