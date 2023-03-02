#!/bin/sh

# Start MariaDB server
service mysql start;

# Wait for the server to start
until mysqladmin ping &>/dev/null; do
    sleep 1
done

mysql -e root "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e root "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e root "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e root "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e root "FLUSH PRIVILEGES;" -p$MYSQL_ROOT_PASSWORD

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe
