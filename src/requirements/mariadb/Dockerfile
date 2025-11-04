FROM alpine:3.21

RUN apk --no-cache add mariadb mariadb-client && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chmod -R 744 /run/mysqld && \
    mysql_install_db --datadir=/var/lib/mysql --skip-test-db --user=mysql --group=mysql

COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

