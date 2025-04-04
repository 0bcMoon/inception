FROM alpine:3.20

RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld 

RUN chmod -R 777 /run/mysqld 

COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

