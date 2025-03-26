
FROM alpine:3.20

RUN apk update && apk add --no-cache nginx 


RUN mkdir /run/php
RUN mkdir -p /var/www/html;

# COPY ./setup.sh /setup.sh

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

