#!/bin/bash

# Start MariaDB server
service mysql start;

sleep 2

mysql -u root  -e "FLUSH PRIVILEGES;"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
echo "[i] DB done"
mysql -u root -e  "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "[i] Create user done"
mysql -u root -e  "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "[i] Grant privileges on wordpress done"
mysql -u root -e  "FLUSH PRIVILEGES;"
echo "[i] Alter root done"
mysql -u root -e  "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "[i] Alter user root done"

mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

sleep 2

exec mysqld_safe


# #!/bin/bash

# # Start MariaDB server
# service mysql start;

# sleep 5

# mysql -u root  -e "FLUSH PRIVILEGES;"
# mysql -u root  -e "CREATE DATABASE IF NOT EXISTS wordpress;"
# echo "[i] DB done"
# mysql -u root  -e  "CREATE USER IF NOT EXISTS 'tno'@'%' IDENTIFIED BY '1234';"
# echo "[i] Create user done"
# mysql -u root  -e  "GRANT ALL PRIVILEGES ON wordpress.* TO 'tno'@'%' IDENTIFIED BY '1234';"
# echo "[i] Grant privileges on wordpress done"
# mysql -u root  -e  "FLUSH PRIVILEGES;"
# echo "[i] Flush done"
# mysql -u root  -e  "ALTER USER 'root'@'localhost' IDENTIFIED BY '4321';"
# echo "[i] Alter user root done"

# mysqladmin -u root -p4321 shutdown

# sleep 2

# exec mysqld_safe

