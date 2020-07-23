FROM alpine:3

ADD main.sh main.sh

RUN apk add --no-cache curl jq

ENTRYPOINT [ "./main.sh" ]
