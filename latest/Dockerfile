FROM alpine:edge

CMD /entrypoint.sh

RUN \
    apk add --no-cache openssl stunnel bash ca-certificates

COPY entrypoint.sh /
COPY stunnel.ini /etc/stunnel/stunnel.conf.template

RUN \
    chmod -R 775 /etc/stunnel && \
    chmod 555 /etc/stunnel/stunnel.conf.template

USER 1000:0
