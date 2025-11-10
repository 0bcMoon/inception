FROM alpine:3.21

RUN apk update && apk add vsftpd shadow

COPY vsftp.conf /etc/vsftpd/vsftpd.conf

COPY setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

