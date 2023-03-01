FROM	alpine:3.16

RUN	set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add nginx \
	&& rm -fv /etc/nginx/nginx.conf \
	&& apk add openssl \
	&& apk add curl 

WORKDIR	/etc/ssl	

RUN	openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=tnoulens.42.fr/C=FR/L=Paris/UID=tnoulens" -keyout rootCA.key -out rootCA.crt \
	&& chmod 400 ./rootCA.key

WORKDIR	/etc/nginx
COPY	./conf/nginx.conf .

RUN	ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
	&& nginx -t

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
