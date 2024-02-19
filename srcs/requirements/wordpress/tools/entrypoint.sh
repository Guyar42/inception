#!/bin/bash

cd /var/www/wordpress

if [ ! -f "wp-config.php" ]; then
    cp /conf/wp-config ./wp-config.php
    
    # Search variables in wp-config.php and replace it with value from .env
    sed -i "s|\$_SQL_DATABASE|$SQL_DATABASE|g" wp-config.php
    sed -i "s|\$_SQL_USER|$SQL_USER|g" wp-config.php
    sed -i "s|\$_SQL_PASSWORD|$SQL_PASSWORD|g" wp-config.php
    sed -i "s|\$_SQL_HOST|$SQL_HOST|g" wp-config.php

    sleep 5

    wp core install --url="$WP_URL" \
					--title="$WP_TITLE" \
					--admin_user="$WP_ADMIN" \
					--admin_password="$WP_ADMIN_PWD" \
					--admin_email="$WP_ADMIN_EMAIL" \
					--skip-email \
                    --path="/var/www/wordpress" --allow-root
   
    wp plugin update --all --allow-root
    
	wp theme install neve --activate --allow-root

    wp user create $WP_USER \
					$WP_USER_EMAIL \
					--role=editor \
					--user_pass=$WP_USER_PWD \
                    --path="/var/www/wordpress" --allow-root

fi

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 --nodaemonize
