FROM	debian:buster

RUN		set -x \
		&& apt update -y \
		&& apt upgrade -y \
		&& apt install nginx -y

RUN		mkdir -p /etc/nginx/ssl \
		&& apt install openssl -y

WORKDIR /etc/nginx/ssl
RUN		openssl req -x509 -nodes -out rootCA.crt -keyout rootCA.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" \
		&& chmod 400 ./rootCA.key

RUN		mkdir -p /var/run/nginx \
		&& nginx -t

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		chmod 777 /var/www/html \
		&& chown -R www-data:www-data /var/www/html 

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
