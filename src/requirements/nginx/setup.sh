#!/bin/sh

set -ex

openssl req -x509 -nodes \
        -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=hibenouk.1337.ma"


sed -i "s/DOMAIN_NAME/$DOMAIN_NAME www.$DOMAIN_NAME/g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'

