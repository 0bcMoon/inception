#!/bin/sh

set -x

cd /var/www/html/


rm -rf $DOMAIN_NAME
mkdir $DOMAIN_NAME

cd $DOMAIN_NAME
wp core download 
mv wp-config-sample.php wp-config.php 

chmod -R 755 $DOMAIN_NAME

sed -i "s/database_name_here/$DB_NAME/1"   wp-config.php

sed -i "s/username_here/$DB_USER/1"        wp-config.php

sed -i "s/password_here/$DB_PASS/1"         wp-config.php

sed -i "s/localhost/mariadb/1"             wp-config.php



sed -i 's/listen = 127.0.0.1:9000/listen = 9000/1' /etc/php83/php-fpm.d/www.conf

mysqladmin ping -u $DB_USER -p$DB_PASS -h mariadb --silent --wait  # wait for mariadb to be ready for connections


wp core install --url=$DOMAIN_NAME/\
                --title=$WP_TITLE \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASS \
                --admin_email=$WP_ADMIN_EMAIL \
                --skip-email --allow-root

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS --allow-root

wp option update siteurl "$DOMAIN_NAME" --allow-root

wp option update home "$DOMAIN_NAME" --allow-root

wp theme install twentytwentyfour --activate --allow-root

wp plugin install create-block-theme --activate --allow-root

wp plugin install gutenberg --activate --allow-root

exec php-fpm83 -F
