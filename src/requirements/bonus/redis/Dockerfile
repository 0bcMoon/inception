
FROM alpine:3.20


RUN apk update && apk add redis



COPY ./setup.sh /setup.sh


CMD ["sh", "/setup.sh"]
