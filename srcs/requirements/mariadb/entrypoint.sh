#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
    /etc/init.d/mariadb setup
    rc-status
    rc-service mariadb start
    echo "CREATE DATABASE $MYSQL_NAME;" > /tmp/sql
    echo "CREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /tmp/sql
    echo "GRANT ALL ON $MYSQL_NAME.* TO $MYSQL_USER@'%' WITH GRANT OPTION;" >> /tmp/sql
    echo "ALTER USER root@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /tmp/sql
    echo "GRANT ALL ON *.* TO root@'localhost' WITH GRANT OPTION;" >> /tmp/sql
    echo "FLUSH PRIVILEGES;" >> /tmp/sql
    cat /tmp/sql | mysql -u root
    rm /tmp/sql
    rc-service mariadb stop
else
    rc-service mariadb start
    rc-service mariadb stop
fi

exec usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql
