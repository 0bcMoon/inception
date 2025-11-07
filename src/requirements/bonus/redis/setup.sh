#/bin/sh

set -xe

sed -i 's/^bind /#bind /' /etc/redis.conf 

echo "requirepass $REDIS_PASS" >> /etc/redis.conf

exec redis-server /etc/redis.conf

