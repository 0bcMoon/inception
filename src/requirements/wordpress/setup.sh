#!/bin/sh

mkdir -p /run/php

mkdir -p /var/www/html

cd /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

sed -i 's/memory_limit = 128M/memory_limit = 512M/' /etc/php83/php.ini

wp core download 

chmod 644 /var/www

chmod 644 /var/www/html

