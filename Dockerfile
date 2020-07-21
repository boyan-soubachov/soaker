FROM alpine:3.12.0

ADD main.sh /main.sh

RUN apk add curl jq

ENTRYPOINT [ "main.sh" ]
