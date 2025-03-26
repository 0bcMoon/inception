#!/bin/sh

set -x

sed -i 's/\[mysqld\]/&\nbind-address=0.0.0.0/1' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/skip-networking/&=0/' /etc/my.cnf.d/mariadb-server.cnf

mysql_install_db --datadir=/var/lib/mysql --skip-test-db --user=mysql --group=mysql \
    --auth-root-authentication-method=socket 
mysqld_safe &
mysqld_pid=$!

# Wait for the server to be started, then set up database and accounts
mysqladmin ping -u root --silent --wait 

mysql --user=root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql --user=root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql --user=root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql --user=root -e "FLUSH PRIVILEGES;"
mysql --user=root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS' ;"

mysqladmin -u root -p"$DB_ROOT_PASS" shutdown

wait $mysqld_pid

exec "mysqld_safe"
