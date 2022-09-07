FROM alpine:3.15

RUN apk update && apk upgrade
RUN apk add php7 \
            php7-common \
            php7-session \
            php7-iconv \
            php7-json \
            php7-gd \
            php7-curl \
            php7-xml \
            php7-mysqli \
            php7-imap \
            php7-cgi \
            fcgi \
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
            php7-fpm \
            php7-opcache \
            php7-phar

RUN mkdir -p /var/www/html \
    && cd /var/www/html \
    && wget http://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \
    && rm latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./config.sh /tmp/config.sh
RUN chmod +x /tmp/config.sh

COPY ./wp-config.php /var/www/html/wordpress/wp-config.php
RUN chmod 644 /var/www/html/wordpress/wp-config.php

RUN adduser -D -g 'Gwww-data' Gwww-data \
    && chown -R Gwww-data:Gwww-data /var/www/html/wordpress/

RUN rm /etc/php7/php-fpm.d/www.conf
COPY ./www.conf /etc/php7/php-fpm.d/www.conf
RUN chmod 644 /etc/php7/php-fpm.d/www.conf

CMD [ "/tmp/config.sh" ]

EXPOSE 9000
