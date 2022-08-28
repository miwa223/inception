#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
    /etc/init.d/mariadb setup
    rc-service mariadb start
    echo "CREATE TABLE '$MyDatabaseName';" >> /tmp/sql
    echo "CREATE USER '$WP_USRE1'@'%' IDENTIFIED BY '$MY_USER1_PW';" >> /tmp/sql
    echo "GRANT ALL ON $MyDatabaseName.* TO '$WP_USER1'@'%' WITH GRANT OPTION;" >> /tmp/sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PW';" >> /tmp/sql
    echo "FLUSH PRIVILEGES;" >> /tmp/sql
    cat /tmp/sql | mysql -u root --password="$MyPassWord"
    rm /tmp/sql
    rc-service mariadb stop
# else
#     rc-service mariadb start
    # rc-service mariadb stop
fi

mysql --user=mysql --datadir=/var/lib/mysql
