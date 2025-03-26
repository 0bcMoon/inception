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
                        wget


COPY ./setup.sh /setup.sh

COPY ./config.sh /config.sh


RUN sh /setup.sh

CMD ["sh", "/config.sh"]
