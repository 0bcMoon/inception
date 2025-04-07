FROM alpine:3.20

RUN apk update && apk add vsftpd shadow

COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

