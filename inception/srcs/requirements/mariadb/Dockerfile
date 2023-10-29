FROM alpine:latest

# RUN apt update -y && \
#     apt upgrade -y && \
#     apt install mariadb-server -y

# RUN apk add --no-cache mariadb mariadb-client

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --quit mariadb mariadb-client

# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# RUN service mariadb start

# RUN mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
# RUN mysql -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# RUN mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# RUN mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# RUN mysql -u root -e "FLUSH PRIVILEGES;"
# RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# RUN exec mysqld_safe