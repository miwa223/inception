FROM alpine:3.15

RUN apk update && apk upgrade \
    && apk add --no-cache mariadb mariadb-client openrc

RUN mkdir -p /run/openrc \
    && touch /run/openrc/softlevel
RUN sed -i 's/cgroup_add_service$/# cgroup_add_service/g' /lib/rc/sh/openrc-run.sh
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
# RUN chmod +x /etc/my.cnf.d/mariadb-server.cnf

COPY ./entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

CMD [ "/tmp/entrypoint.sh" ]
