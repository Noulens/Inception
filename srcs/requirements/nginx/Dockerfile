FROM	alpine:3.16

RUN	set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add bash \
	&& apk add -y nginx \
	&& apk add -y openssl

RUN	mkdir -p /usr/src/app \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
