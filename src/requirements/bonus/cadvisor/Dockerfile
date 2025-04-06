FROM alpine:3.20


WORKDIR /app

RUN wget -O cadvisor https://github.com/google/cadvisor/releases/download/v0.52.1/cadvisor-v0.52.1-linux-amd64

RUN chmod +x ./cadvisor

CMD ["./cadvisor", "--port=8000"]
