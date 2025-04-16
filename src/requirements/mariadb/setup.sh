#!/bin/sh

set -x

sed -i 's/\[mysqld\]/&\nbind-address=0.0.0.0/1' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/skip-networking/&=0/' /etc/my.cnf.d/mariadb-server.cnf


mysqld_safe &

mysqld_pid=$!

mysqladmin ping -u root --silent --wait 

mysql --user=root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql --user=root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql --user=root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql --user=root -e "FLUSH PRIVILEGES;"
mysql --user=root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS' ;"

mysqladmin -u root -p"$DB_ROOT_PASS" shutdown

wait $mysqld_pid

exec "mysqld_safe"
