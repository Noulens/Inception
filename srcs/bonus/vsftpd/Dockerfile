FROM	alpine:3.16

RUN		set -x\
		&& apk update\
		&& apk upgrade\
		&& apk add vim fish

RUN		apk add vsftpd\
		&& mkdir -p /var/www/html

WORKDIR	/scripts
COPY	./conf/run.sh .
RUN		chmod +x ./run.sh

WORKDIR	/etc/vsftpd
COPY	./conf/vsftpd.conf ./vsftpd.conf

EXPOSE	20 21

ENTRYPOINT [ "/scripts/run.sh" ]