FROM	debian:buster

RUN	set -x \
	&& apt update -y \
	&& apt upgrade -y

RUN apt-get install mariadb-server mariadb-client -y

WORKDIR	/etc/mysql/mariadb.conf.d/
COPY	conf/50-server.cnf ./50-server.cnf

WORKDIR	/scripts
COPY	./conf/run.sh .
RUN		chmod -R 755 /scripts

WORKDIR	/

EXPOSE	3306

ENTRYPOINT	["sh", "/scripts/run.sh"]
