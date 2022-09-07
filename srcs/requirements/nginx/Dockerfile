FROM alpine:3.15

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /var/www/html
COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./conf/index.html /var/www/html/index.html

RUN chmod 777 /etc/nginx/http.d/default.conf
RUN chmod 777 /var/www/html/index.html
RUN sed -i -e "s/user nginx;/user Gwww-data;/g" /etc/nginx/nginx.conf

RUN mkdir -p /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=JP/ST=Tokyo/O=42tokyo/CN=mmasubuc.42.fr" \
    -addext "subjectAltName=DNS:mmasubuc.42.fr" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

RUN adduser -D -g 'Gwww-data' Gwww-data
RUN chown -R Gwww-data:Gwww-data /var/lib/nginx
RUN chown -R Gwww-data:Gwww-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
