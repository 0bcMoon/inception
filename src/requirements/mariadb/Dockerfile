FROM alpine:3.20

RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld 

RUN chown -R mysql:mysql /run/mysqld 

RUN chmod -R 744 /run/mysqld 

RUN mysql_install_db --datadir=/var/lib/mysql --skip-test-db --user=mysql --group=mysql

COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

