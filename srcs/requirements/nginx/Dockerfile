FROM alpine:3.15

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./conf/index.html /var/www/localhost/htdocs/index.html

RUN chmod +x /etc/nginx/nginx.conf
RUN chmod +x /etc/nginx/http.d/default.conf
RUN chmod +x /var/www/localhost/htdocs/index.html

RUN mkdir -p /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=JP/ST=Tokyo/O=42tokyo/CN=mmasubuc.42.fr" \
    -addext "subjectAltName=DNS:mmasubuc.42.fr" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

RUN adduser -D -S -G www-data www-data

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
