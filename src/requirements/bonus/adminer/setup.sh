#!/bin/bash


wget wget https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php


chmod -R 755 /var/www/html/adminer


sed -i 's/listen = 127.0.0.1:9000/listen = 9000/1' /etc/php83/php-fpm.d/www.conf

exec php-fpm83 -F

