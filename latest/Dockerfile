FROM alpine:edge

CMD /entrypoint.sh

RUN \
    apk add --no-cache openssl stunnel bash

COPY entrypoint.sh /
COPY stunnel.ini /etc/stunnel/stunnel.conf

USER 1000:0
