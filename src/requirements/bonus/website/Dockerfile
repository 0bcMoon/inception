FROM alpine:3.21

RUN apk --no-cache add python3

WORKDIR /app

COPY ./site/ .

CMD ["python3", "-m", "http.server", "4000"]
