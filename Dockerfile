# syntax=docker/dockerfile:1

FROM golang:1.19
WORKDIR /build
RUN git clone https://github.com/b3niup/alertmanager-ntfy.git .
RUN go mod download
RUN GOOS=linux go build -o /alertmanager-ntfy ./cmd/alertmanager-ntfy

VOLUME /etc/alertmanager-ntfy
EXPOSE 8000
ENTRYPOINT ["/alertmanager-ntfy"]
CMD ["--configs", "/etc/alertmanager-ntfy/alertmanager-ntfy.yml"]
