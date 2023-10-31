FROM debian:bullseye

RUN	mkdir -p /var/lib/mysql

RUN	apt update -y \
		&& apt upgrade -y \
		&& apt install mariadb-server -y

EXPOSE	3306

COPY 	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY 	tools/entrypoint.sh	./entrypoint.sh
RUN		chmod +x ./entrypoint.sh

CMD		["sh", "./entrypoint.sh"]
