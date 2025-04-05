FROM alpine:3.20

RUN apk add  --no-cache php83 \
                        php83-common \
                        php83-phar \
                        php83-fpm  \
                        php83-openssl \
                        php83-sockets \
                        php83-curl \
                        php83-fileinfo \
                        php83-mbstring \
                        php83-mysqli \
                        php83-redis \
                        php83-tokenizer \
                        php83-ctype \
                        wget \
                        mariadb-client 




COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

