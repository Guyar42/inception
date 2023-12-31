#!/bin/sh
cat .setup 2> /dev/null

if [ $? -ne 0 ]; then
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	while ! mysqladmin ping -h "$SQL_HOST" --silent; do
    sleep 1
	done

	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .setup
fi

usr/bin/mysqld_safe --datadir=/var/lib/mysql
