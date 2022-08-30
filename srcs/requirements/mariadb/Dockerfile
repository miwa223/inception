FROM alpine:3.15

RUN apk update && apk upgrade \
    && apk add --no-cache mariadb mariadb-client openrc

RUN mkdir -p /run/openrc \
    && touch /run/openrc/softlevel

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN chmod +x /etc/my.cnf.d/mariadb-server.cnf

COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 443
