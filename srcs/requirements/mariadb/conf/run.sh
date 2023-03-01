#!/bin/sh

# Start MariaDB server
service mysql start;

# Wait for the server to start
until mysqladmin ping &>/dev/null; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" -p$MYSQL_ROOT_PASSWORD
mysql -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" -p$MYSQL_ROOT_PASSWORD
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" -p$MYSQL_ROOT_PASSWORD
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" -p$MYSQL_ROOT_PASSWORD
mysql -e "FLUSH PRIVILEGES;" -p$MYSQL_ROOT_PASSWORD

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe
