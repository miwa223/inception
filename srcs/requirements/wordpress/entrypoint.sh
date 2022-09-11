#!/bin/sh

while mysql -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" &> /dev/null; do
    sleep 1
done

sed -i -e "s/MYSQL_NAME/$MYSQL_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i -e "s/MYSQL_USER/$MYSQL_USER/g" /var/www/html/wordpress/wp-config.php
sed -i -e "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /var/www/html/wordpress/wp-config.php

# wordpress setup
wp core download --allow-root --path=/var/www/html/wordpress
wp core is-installed --allow-root --path=/var/www/html/wordpress 2>/dev/null
if [ $? != 0 ]; then
    wp core install --url=http://$DOMAIN_NAME/ --title=$TITLE \
        --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW \
        --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/html/wordpress
    wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PW \
        --allow-root --path=/var/www/html/wordpress
fi

exec /usr/sbin/php-fpm7 -F
