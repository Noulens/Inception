FROM	alpine:3.16

RUN	set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add openrc --no-cache \
	&& apk add --no-cache mariadb mariadb-client mariadb-server-utils pwgen \
	&& rm -f /etc/my.cnf

WORKDIR	/etc
COPY	./conf/my.cnf .

WORKDIR	/scripts
COPY	./conf/run.sh .
RUN	chmod -R 755 /scripts

WORKDIR	/

EXPOSE	3306

ENTRYPOINT	["/scripts/run.sh"]
