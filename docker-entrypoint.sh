#!/bin/bash

set -ex

db_path="/var/lib/mysql/${MYSQL_DATABASE}"
dle_path=/var/www/html

# Initialize MySQL Database unless it has been initialized already
if [ ! -d "${db_path}" ]; then
    while [ ! -e /var/run/mysqld/mysqld.sock]; do
        echo "Waiting for mysqld to start..."
        sleep 1
    done

    mysql -e "CREATE DATABASE ${MYSQL_DATABASE};"
    mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"

    test -e "$db_path"
fi &

# Run supervisord
exec /usr/bin/supervisord -n
