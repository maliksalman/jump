FROM alpine:3
LABEL maintainer=salman@the-tech-warriors.com

RUN apk update && apk add --no-cache bash curl jq bind-tools screen tmux openssh git openssl

COPY curlloop /usr/local/bin/curlloop
RUN chmod 755 /usr/local/bin/curlloop
