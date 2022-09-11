FROM alpine:3.15

RUN apk update && apk upgrade
RUN apk add php7 \
            php7-fpm \
            php7-mysqli \
            php7-common \
            php7-session \
            php7-cgi \
            php7-phar \
            php7-iconv \
            php7-json \
            php7-gd \
            php7-curl \
            php7-xml \
            php7-imap \
            php7-pdo \
            php7-pdo_mysql \
            php7-soap \
            php7-xmlrpc \
            php7-posix \
            php7-mcrypt \
            php7-gettext \
            php7-ldap \
            php7-ctype \
            php7-dom \
            php7-simplexml \
            php7-opcache \
            mariadb-client

RUN mkdir -p /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN adduser -D -g 'Gwww-data' Gwww-data \
    && chown -R Gwww-data:Gwww-data /var/www/html/wordpress/

COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

CMD [ "/tmp/entrypoint.sh" ]
