#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
    /etc/init.d/mariadb setup
    rc-status
    rc-service mariadb start
    echo "CREATE DATABASE '$MYSQL_DB_NAME';" >> /tmp/sql
    echo "CREATE USER '$MYSQL_DB_USERNAME'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';" >> /tmp/sql
    echo "GRANT ALL ON $MYSQL_DB_NAME.* TO '$MYSQL_DB_USERNAME'@'%' WITH GRANT OPTION;" >> /tmp/sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD';" >> /tmp/sql
    echo "FLUSH PRIVILEGES;" >> /tmp/sql
    cat /tmp/sql | mysql -u root
    rm /tmp/sql
    rc-service mariadb stop
else
    rc-service mariadb start
    rc-service mariadb stop
fi

mysqld --user=mysql --datadir=/var/lib/mysql
