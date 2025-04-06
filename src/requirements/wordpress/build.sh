#!/bin/sh

set -x

sed -i 's/memory_limit = 128M/memory_limit = 512M/' /etc/php83/php.ini

set -x

mkdir -p /run/php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp


rm -rf *

wp core download 

mv wp-config-sample.php wp-config.php 

