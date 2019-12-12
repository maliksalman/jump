FROM alpine:3
MAINTAINER salman@the-tech-warriors.com
RUN apk update && apk add bash curl jq bind-tools screen
COPY curlloop /usr/local/bin/curlloop
RUN chmod 755 /usr/local/bin/curlloop
