
FROM alpine:3.21

RUN apk add --no-cache redis

COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

