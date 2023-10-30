FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y mariadb-server

RUN mkdir -p /var/lib/mysqld /run/mysqld

COPY conf/create_db.sql /tmp/create_db.sql
COPY conf/mariadb-server.cnf	/etc/mariadb.conf.d/mariadb-server.cnf
COPY tools/entrypoint.sh ./entrypoint.sh

RUN mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal
RUN chmod +x ./entrypoint.sh
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysqld

EXPOSE 3306

ENTRYPOINT ["sh", "entrypoint.sh" ]
