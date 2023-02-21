FROM	alpine:3.16

RUN	set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add shadow 
#	&& adduser -D -g 'www' www \
#	&& mkdir /www \
#	&& chown -R www:www /var/lib/nginx \
#	&& chown -R www:www /www

WORKDIR	/etc/ssl	

RUN	openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=tnoulens.42.fr/C=FR/L=Paris/UID=tnoulens" -keyout rootCA.key -out rootCA.crt

RUN	ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
