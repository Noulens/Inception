FROM	debian:buster

RUN		apt update -y \
		&& apt upgrade -y

RUN		apt install mariadb-server mariadb-client -y

WORKDIR	/etc/mysql/mariadb.conf.d/
COPY	conf/50-server.cnf ./50-server.cnf

RUN		mkdir -p /var/lib/mysql /var/run/mysqld \
		&& chown -R mysql:mysql /var/run/mysqld

WORKDIR	/var/mysql
COPY	./conf/run.sh .
RUN		chmod -R 755 /var/mysql/run.sh

ENTRYPOINT	["sh", "/var/mysql/run.sh"]

# connect to mariadb
# mysql -u root -p#MDB_ROOT_PASSWORD -h localhost wordpress
# SHOW DATABASES;
# SHOW TABLES;
# SHOW COLUMNS FROM wp_comments FROM wordpress;
# SELECT comment_content FROM wp_comments;
