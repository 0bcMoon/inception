FROM alpine:3.20

RUN apk update && apk  add python3

WORKDIR /app

COPY ./site/ .

CMD ["python3", "-m", "http.server", "4000"]
