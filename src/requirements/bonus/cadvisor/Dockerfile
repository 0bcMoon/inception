FROM alpine:3.21

RUN apk --no-cache add wget

WORKDIR /app

RUN --mount=type=cache,target=/tmp/cache \
    wget -O cadvisor https://github.com/google/cadvisor/releases/download/v0.52.1/cadvisor-v0.52.1-linux-amd64 && \
    chmod +x ./cadvisor

CMD ["./cadvisor", "--port=8000"]
