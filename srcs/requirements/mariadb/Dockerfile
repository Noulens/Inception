FROM	debian:buster

RUN	set -x \
	&& apt update -y \
	&& apt upgrade -y

RUN apt install mariadb-server vim fish -y

WORKDIR	/etc/mysql/mariadb.conf.d/
COPY	conf/50-server.cnf ./50-server.cnf

RUN		mkdir /scripts
WORKDIR	/scripts
COPY	./conf/run.sh .
RUN		chmod -R 755 /scripts

WORKDIR	/

EXPOSE	3306

ENTRYPOINT	["sh", "/scripts/run.sh"]
