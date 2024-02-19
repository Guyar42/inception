FROM	alpine:3.15

RUN	apk update && apk add mariadb mariadb-client

COPY	conf/create_db.sql /tmp/create_db.sql
COPY	tools/entrypoint.sh ./entrypoint.sh
COPY	conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN	mkdir -p /var/lib/mysqld /run/mysqld
RUN	mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

RUN	chmod +x ./entrypoint.sh
RUN	chown -R mysql:mysql /var/lib/mysql
RUN	chown -R mysql:mysql /run/mysqld

ENTRYPOINT ["sh", "entrypoint.sh"]