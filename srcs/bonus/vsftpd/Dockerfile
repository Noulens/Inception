FROM	alpine:3.16

RUN		set -x\
		&& apk update\
		&& apk upgrade\
		&& apk add vim fish openssl

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN		apk add vsftpd\
		&& mkdir -p /var/www/html

WORKDIR	/scripts
COPY	./conf/run.sh .
RUN		chmod +x ./run.sh

WORKDIR	/etc/vsftpd
COPY	./conf/vsftpd.conf ./vsftpd.conf

EXPOSE	20 21

ENTRYPOINT [ "/scripts/run.sh" ]