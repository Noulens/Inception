#!/bin/sh

sleep 10

if [ ! -f '/var/www/wordpress/wp-config.php' ]; then
	echo "[i] Wordpress is configuring...."
	echo "	Linking database ${MYSQL_DATABASE} to  ${MYSQL_USER} with password ${MYSQL_PASSWORD}"
	wp --allow-root core download --path=/var/www/wordpress
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=$MYSQL_HOST \
		--path='/var/www/wordpress'
	sleep 3
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
		--path='/var/www/wordpress' \
		>> logs_wp.txt
fi

mkdir -p /usr/logs/php-fpm

php-fpm7.3  -F
