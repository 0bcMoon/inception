FROM alpine:3.21

RUN apk --no-cache add nginx openssl && \
    mkdir -p /run/php /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

