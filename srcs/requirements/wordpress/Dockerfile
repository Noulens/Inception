FROM	debian:buster

RUN		apt update -y \
		&& apt upgrade -y \
		&& apt install -y curl \
		&& apt-get install -y php7.3 \
		php-fpm \
		php-mysql \
		mariadb-client \
		&& apt install -y net-tools


# WORKDIR	/var/www/html/worpress
# RUN		tar -xf wordpress-6.0-fr_FR.tar.gz \
# 		&& rm wordpress-6.0-fr_FR.tar.gz \
# 		&& chown -R root:root /var/www/

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/bin/wp

WORKDIR	/etc/php/7.3/fpm/pool.d
COPY	./conf/www.conf ./www.conf

WORKDIR /tmp
COPY	/conf/config_auto.sh ./config_auto.sh
RUN		chmod +x ./config_auto.sh

RUN		mkdir -p /run/php /var/log/php7 /var/www/html/wordpress 

WORKDIR	/var/www/html/wordpress

# EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/config_auto.sh" ]
