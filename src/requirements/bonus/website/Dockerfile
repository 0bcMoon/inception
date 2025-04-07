FROM alpine:3.20

RUN apk update && apk  add nodejs

WORKDIR /app

COPY ./site/ .

CMD ["node", "server.js"]
