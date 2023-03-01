FROM	alpine:3.16

COPY	./conf/enable_testing_repo.sh .

RUN	set -x \
	&& chmod 755 ./enable_testing_repo.sh \
	&& ./enable_testing_repo.sh \
	&& rm -f ./enable_testing_repo.sh \
	&& apk update \
	&& apk upgrade \
	&& apk add curl \
	&& apk add php7 php7-fpm php7-opcache \
	&& apk add php7-gd php7-mysqli php7-zlib php7-curl mariadb-client \
	&& apk del nginx \
	&& rm -rf /var/cache/apk/* \
	&& ln -s /usr/bin/php7 /usr/bin/php \
	&& php --version

RUN	mkdir -p /var/www \
	&&chown -R 100:101 /var/www \
	&& chown -R 100:82 /var/www

WORKDIR	/var/www
RUN	wget http://wordpress.org/latest.tar.gz \
	&& tar -xzf latest.tar.gz \
	&& rm latest.tar.gz

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/bin/wp-cli \
	&& chown 100:101 /usr/bin/wp-cli

WORKDIR	/etc/php7
COPY	./conf/php-fpm.conf .

WORKDIR	/
COPY	./conf/config_auto.sh .
RUN	chmod +x /config_auto.sh 

EXPOSE	9000

ENTRYPOINT ["sh", "./config_auto.sh"]
