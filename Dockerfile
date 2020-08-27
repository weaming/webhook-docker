FROM golang:1.14-alpine AS build
RUN apk update; apk add git
RUN git clone https://github.com/adnanh/webhook; cd webhook; go build .; pwd

FROM alpine
WORKDIR /etc/webhook
RUN apk update; apk add docker-cli fish bash zsh git vim
COPY --from=build /go/webhook/webhook /usr/local/bin

CMD ["/usr/local/bin/webhook", "-hooks", "hooks.json", "-verbose", "-hotreload"]

