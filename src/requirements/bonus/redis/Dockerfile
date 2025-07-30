
FROM alpine:3.21


RUN apk update && apk add redis

COPY ./setup.sh /setup.sh

CMD ["sh", "/setup.sh"]

