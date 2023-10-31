#!/bin/sh

service mariadb start

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]
then
	echo "Database already exists"
else
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
	mysql -uroot -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';"
	mysql -uroot -e "UPDATE mysql.user SET Host='localhost' WHERE User='root';"
	mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

	mysql -uroot -e "FLUSH PRIVILEGES;"
	
fi

service mariadb stop

exec "$@"