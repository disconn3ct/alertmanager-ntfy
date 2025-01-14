# syntax=docker/dockerfile:1

FROM golang:1.23
WORKDIR /build
RUN git clone https://github.com/b3niup/alertmanager-ntfy.git .
RUN go mod download
RUN GOOS=linux go build -o /alertmanager-ntfy ./cmd/alertmanager-ntfy

VOLUME /config
EXPOSE 8000
ENTRYPOINT ["/alertmanager-ntfy"]
CMD ["--configs", "/config/config.yaml"]
