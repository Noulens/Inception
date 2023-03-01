FROM	alpine:3.16

RUN	set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache mariadb mariadb-client mariadb-server-utils pwgen \
	&& apk add openrc \
	&& rm -f /etc/my.cnf

RUN	openrc \
	&& touch /run/openrc/softlevel

WORKDIR	/etc
COPY	./conf/my.cnf .

WORKDIR	/scripts
COPY	./conf/run.sh .
RUN	chmod -R 755 /scripts

WORKDIR	/

EXPOSE	3306

ENTRYPOINT	["/scripts/run.sh"]
