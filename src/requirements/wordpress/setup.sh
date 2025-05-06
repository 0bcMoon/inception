#!/bin/sh

set -x


sed -i "s/database_name_here/$DB_NAME/1"   wp-config.php

sed -i "s/username_here/$DB_USER/1"        wp-config.php

sed -i "s/password_here/$DB_PASS/1"         wp-config.php

sed -i "s/localhost/mariadb/1"             wp-config.php

sed -i 's/listen = 127.0.0.1:9000/listen = 9000/1' /etc/php83/php-fpm.d/www.conf

mysqladmin ping -u $DB_USER -p$DB_PASS -h mariadb --silent --wait  # wait for mariadb to be ready for connections

sleep 5

wp core install --url=$DOMAIN_NAME/\
                --title=$WP_TITLE \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASS \
                --admin_email=$WP_ADMIN_EMAIL \
                --skip-email 


wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS 

wp plugin install redis-cache --activate

wp theme install twentytwentyfour --activate

wp config set WP_REDIS_HOST 'redis'

wp config set WP_REDIS_PORT '6379'

wp config set WP_REDIS_PASSWORD $REDIS_PASS

wp redis enable

chmod -R 777 /var/www/html/wordpress

exec php-fpm83 -F
