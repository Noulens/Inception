#!/bin/sh

if [ ! -f '/var/www/html/wordpress/.my_wp_config' ]; then
	echo "[i] Wordpress is configuring...."
	echo "	Linking database ${MDB_DATABASE} to  ${MDB_USER} with password ${MDB_PASSWORD}"
	wp core download --allow-root
	rm -f /var/www/html/wp-config.php
	wp config create --allow-root \
		--skip-check \
		--dbname=$MDB_DATABASE \
		--dbuser=$MDB_USER \
		--dbpass=$MDB_PASSWORD \
		--dbhost=$MDB_HOST \
		--path='/var/www/html/wordpress'
	wp core install --title=$SITE_TITLE \
		--admin_user=$ADMIN \
		--admin_password=$ADMIN_PW \
		--admin_email=$ADMIN_MAIL \
		--skip-email --url=$WEBSITE \
		--allow-root
	wp user create $USER42 $USER42_MAIL \
		--role=author \
		--user_pass=$USER42_PW \
		--allow-root \
		--path='/var/www/html/wordpress' \
		>> logs_wp.txt
	touch /var/www/html/wordpress/.my_wp_config
fi

mkdir -p /usr/logs/php-fpm

php-fpm7.3  -F
