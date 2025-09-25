FROM alpine:3 AS builder

ARG YTT_VER=v0.52.1

COPY curlloop /my/curlloop
RUN chmod 755 /my/curlloop

RUN if [ "$(uname -m)" = "aarch64" ]; then echo -n arm64 > arch; else echo -n amd64 > arch; fi

RUN wget https://github.com/carvel-dev/ytt/releases/download/${YTT_VER}/ytt-linux-$(cat arch) -O /my/ytt
RUN chmod 755 /my/ytt



FROM alpine:3
LABEL maintainer=salman@the-tech-warriors.com

RUN apk update && apk add --no-cache bash curl jq bind-tools screen tmux openssh git openssl xmlstarlet kubectl

COPY --from=builder /my/* /usr/local/bin/
