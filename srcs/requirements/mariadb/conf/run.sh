#!/bin/sh

if [ ! -f /var/lib/mysql/.my_db_is_done ]; then
	touch mktemp.sql
	tfile=./mktemp.sql
	chmod +x $tfile
		if [ ! -f "$tfile" ]; then
		    return 1
		fi
	cat << EOF > $tfile
CREATE DATABASE ${MDB_DATABASE};
CREATE USER '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASSWORD}' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';
FLUSH PRIVILEGES ;
EOF
	cat $tfile
	service mysql start
	while ! mysqladmin ping --silent; do
	    sleep 1
	done
	echo "started"
	sleep 1
	mysql -D mysql < $tfile
	mysqladmin -u root -p${MDB_ROOT_PASSWORD} shutdown
	rm -f $tfile
	touch /var/lib/mysql/.my_db_is_done
fi

exec mysqld_safe
