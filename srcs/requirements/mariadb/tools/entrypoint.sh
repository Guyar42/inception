# Check if the setup file already exists
cat .setup 2> /dev/null

if [ $? -ne 0 ]; then
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	# Wait for the MySQL server to be up
	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done

	# Execute the SQL script in MariaDB
	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .setup
fi

usr/bin/mysqld_safe --datadir=/var/lib/mysql
